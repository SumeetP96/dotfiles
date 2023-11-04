local config = function()
  require("neoconf").setup({})

	local lspconfig = require("lspconfig")

	local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- set keymaps on the active lsp server
	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
		vim.keymap.set("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
		vim.keymap.set("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
		vim.keymap.set("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
		vim.keymap.set("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
		vim.keymap.set("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
		vim.keymap.set("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
		vim.keymap.set("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
		vim.keymap.set("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
		vim.keymap.set("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

		if client.name == "pyright" then
			vim.keymap.set("<Leader>oi", "PyrightOrganizeImports", "n", opts)
		end
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilites,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- Configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
			},
		},
	})

	-- Format on save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}

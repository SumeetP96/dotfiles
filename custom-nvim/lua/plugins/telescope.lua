local k = vim.keymap

local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = "move_selection_next",
          ["<C-p>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
  })
end

return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.4',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = {
    k.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
    k.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
    k.set("n", "<leader>ff", ":Telescope find_files<CR>"),
    k.set("n", "<leader>fa", ":Telescope <CR>"),
    k.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
    k.set("n", "<leader>fb", ":Telescope buffers<CR>"),
  }
}

return {
	"nordtheme/vim",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd('colorscheme nord')
	end
}

-- return {
--   "catppuccin/nvim", 
--   name = "catppuccin", 
--   priority = 1000,
-- }

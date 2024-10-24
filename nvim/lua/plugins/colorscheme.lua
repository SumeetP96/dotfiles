return {

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
  },

  -- Monokai Pro
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    priority = 1000,
    opts = {
      filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
    },
  },

  {
    "arcticicestudio/nord-vim",
    name = "nord",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}

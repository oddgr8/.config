return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", desc = "+Augment" },
        { "gF", desc = "Go to location under cursor" },
      },
    },
  },
}

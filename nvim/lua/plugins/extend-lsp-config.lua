return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        root_dir = function()
          return vim.fn.getcwd()
        end,
      },
    },
  },
}

-- In your LazyVim config (e.g., in a file under lua/plugins/)
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        -- ... other pyright settings ...
        root_dir = function()
          -- Prioritize project markers, then fall back to cwd
          return vim.fn.getcwd()
        end,
      },
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.fn.getcwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      {
        "<leader>fm",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
    },
    opts = {
      mappings = {
        go_in_vertical = "<C-V>",
        go_in_horizontal = "<C-S>",
        go_in_vertical_plus = "<C-V>",
        go_in_horizontal_plus = "<C-S>",
        toggle_hidden = ";.",
        change_cwd = ";c",
      },
      options = {
        use_as_default_explorer = true,
      },
    },
  },
}

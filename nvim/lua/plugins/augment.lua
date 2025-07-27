return {
  "augmentcode/augment.vim",
  init = function()
    vim.g.augment_workspace_folders = { vim.fn.getcwd() }
  end,
  keys = {
    { "<leader>ac", "<cmd>Augment chat<cr>", desc = "Augment chat" },
    { "<leader>an", "<cmd>Augment chat-new<cr>", desc = "Augment chat-new" },
    { "<leader>at", "<cmd>Augment chat-toggle<cr>", desc = "Augment chat-toggle" },
  },
}

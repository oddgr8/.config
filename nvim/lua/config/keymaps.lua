-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>yr", function()
  local relative_path = vim.fn.expand("%:~:.") -- %:r expands to relative path without extension
  vim.fn.setreg("+", relative_path) -- Copy to clipboard (plus register)
  print("Copied relative path: " .. relative_path)
end, { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>yR", function()
  local location = vim.fn.expand("%:~:.") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col(".") -- %:r expands to relative path without extension
  vim.fn.setreg("+", location) -- Copy to clipboard (plus register)
  print("Copied location: " .. location)
end, { desc = "Copy location" })

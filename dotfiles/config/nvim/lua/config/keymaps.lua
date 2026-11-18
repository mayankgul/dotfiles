-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del("n", "<leader><leader>")

vim.keymap.set("n", "<leader>Mi", ":MoltenInit<CR>")
vim.keymap.set("n", "<leader>Mr", ":MoltenEvaluateOperator<CR>")
vim.keymap.set("n", "<leader>Ml", ":MoltenEvaluateLine<CR>")
vim.keymap.set("v", "<leader>Mr", ":<C-u>MoltenEvaluateVisual<CR>")
vim.keymap.set("n", "<leader>Mc", ":MoltenReevaluateCell<CR>")
vim.keymap.set("n", "<leader>Md", ":MoltenDelete<CR>")

require("which-key").add({
  { "<leader>p", group = "Pets", icon = require("utils.icons").Pets },
  { "<leader>a", group = "AI", icon = require("utils.icons").AI },
  { "<leader>g", group = "Git", icon = require("utils.icons").Git },
  { "<leader>d", group = "Debug", icon = require("utils.icons").Debug },
  { "<leader>n", group = "Notes", icon = require("utils.icons").Notes },
})

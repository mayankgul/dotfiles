-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ruler = true

vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")

vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize",
  "terminal",
}

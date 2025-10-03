-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.relativenumber = false -- relative line numbers
opt.spell = false          -- disable spell check by default
opt.termguicolors = true

-- Enable AI completions in the completion menu (for Copilot with blink.cmp)
vim.g.ai_cmp = true

-- Fix for LazyVim foldexpr deprecation warning
-- Use vim.treesitter.foldexpr() instead of deprecated LazyVim.ui.foldexpr()
if vim.fn.has("nvim-0.10") == 1 then
  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end

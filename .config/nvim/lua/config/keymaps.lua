-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TODO check if this map function is necessary in this file or if the main
-- one from the LazyVim config can be used somehow

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "gh", "^", { desc = "Move to the beginning of the line" })
map("n", "gl", "$", { desc = "Move to the end of the line" })
map("n", "ge", "G", { desc = "Last line" })

--Try making this work somehow
--map("n", "<M-x>", "_x", { desc = "Delete character without copying" })
--map("n", "<M-dd>", "_dd", { desc = "Delete line without copying" })

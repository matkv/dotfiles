local function open_obsidan()
  vim.cmd("cd /mnt/c/Users/matko/Documents/Obsidian Vault/") -- Change directory
  vim.cmd("edit notepad.md") -- Open the file
end

return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      -- Insert the Obsidian entry as the second-to-last entry
      table.insert(opts.config.center, #opts.config.center - 1, {
        icon = "  ",
        desc = "Open Obsidian vault",
        key = "o",
        shortcut = "o", -- Use shortcut for display
        action = open_obsidan,
      })
    end,
  },
}

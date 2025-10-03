-- Get the hostname to determine which workspace to use
local hostname = vim.g.current_hostname or vim.fn.hostname()

-- Define workspaces based on hostname
local workspace
if hostname == "omen" then
  workspace = {
    name = "omen",
    path = "/mnt/c/Users/matko/Documents/Obsidian Vault/",
  }
elseif hostname == "arch" then
  workspace = {
    name = "arch",
    path = "~/documents/Obsidian Vault/",
  }
end

-- Only return the plugin config if we have a valid workspace for this hostname
if workspace then
  return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        workspace,
      },
      disable_frontmatter = true,
    },
  }
end

return {}

-- Get the hostname to determine which workspace to use
local hostname = vim.g.current_hostname or vim.fn.hostname()

-- Define workspaces based on hostname
local workspace
if hostname == "omen" then
  workspace = {
    name = "omen",
    path = vim.fn.expand("~/obsidian/"),
  }
elseif hostname == "arch" then
  workspace = {
    name = "arch",
    path = vim.fn.expand("~/documents/Obsidian Vault/"),
  }
end

-- Only return the plugin config if we have a valid workspace for this hostname
if workspace then
  return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    opts = {
      legacy_commands = false,
      frontmatter = {
        enabled = false,
      },
      workspaces = { workspace },
    },
  }
end

return {}

-- Get the hostname to determine which workspace to use
local hostname = vim.g.current_hostname or vim.fn.hostname()

-- Define workspaces based on hostname
local workspace
if hostname == "omen" then
  workspace = {
    name = "omen",
    path = vim.fn.expand("/mnt/c/Users/matko/Documents/Obsidian Vault/"),
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
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",

    opts = {
      legacy_commands = false,
      disable_frontmatter = true,

      workspaces = { workspace },
    },
    callbacks = {
      enter_note = function(note)
        local buf = note and note.bufnr or vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<CR>", function()
          require("obsidian.api").smart_action()
        end, { buffer = buf, desc = "Obsidian Smart Action" })
      end,
    },
  }
end

return {}

if vim.g.current_hostname == "omen" then
  return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      -- Setup obsidian.nvim with the latest changes
      require("obsidian").setup(opts)

      -- Create which-key mappings for common commands
      local wk = require("which-key")

      -- Add keybindings with `wk.add`
      wk.add({
        -- Normal mode bindings for obsidian
        { "<leader>o", group = "obsidian" },
        { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open note", mode = "n" },
        { "<leader>od", "<cmd>ObsidianDailies -10 0<cr>", desc = "Daily notes", mode = "n" },
        { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image", mode = "n" },
        { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch", mode = "n" },
        { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search", mode = "n" },
        { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags", mode = "n" },
        { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Links", mode = "n" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks", mode = "n" },
        { "<leader>om", "<cmd>ObsidianTemplate<cr>", desc = "Template", mode = "n" },
        { "<leader>on", "<cmd>ObsidianQuickSwitch nav<cr>", desc = "Nav", mode = "n" },
        { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename", mode = "n" },
        { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Workspace", mode = "n" },
        {
          "<leader>oc",
          function()
            local day_of_week = os.date("%A")
            local offset_start

            -- Using an if-elseif block instead of a table
            if day_of_week == "Sunday" then
              offset_start = 1
            elseif day_of_week == "Monday" then
              offset_start = 0
            elseif day_of_week == "Tuesday" then
              offset_start = -1
            elseif day_of_week == "Wednesday" then
              offset_start = -2
            elseif day_of_week == "Thursday" then
              offset_start = -3
            elseif day_of_week == "Friday" then
              offset_start = -4
            elseif day_of_week == "Saturday" then
              offset_start = 2
            end

            vim.cmd(string.format("ObsidianDailies %d %d", offset_start, offset_start + 4))
          end,
          desc = "Current week",
          mode = "n",
        },

        -- Visual mode bindings for obsidian
        { mode = "v" },
        {
          "<leader>oe",
          function()
            local title = vim.fn.input({ prompt = "Enter title (optional): " })
            vim.cmd("ObsidianExtractNote " .. title)
          end,
          desc = "Extract text into new note",
          mode = "v",
        },
        {
          "<leader>ol",
          function()
            vim.cmd("ObsidianLink")
          end,
          desc = "Link text to an existing note",
          mode = "v",
        },
        {
          "<leader>on",
          function()
            vim.cmd("ObsidianLinkNew")
          end,
          desc = "Link text to a new note",
          mode = "v",
        },
      })
    end,
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/mnt/c/Users/matko/Documents/Obsidian Vault",
        },
      },
      templates = {
        folder = "/mnt/c/Users/matko/Documents/Obsidian Vault/templates",
      },
    },
  }
end

return {}

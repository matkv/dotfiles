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
    -- Setup obsidian.nvim
    require("obsidian").setup(opts)

    -- Create which-key mappings for common commands.
    local wk = require "which-key"

    wk.register {
      ["<leader>o"] = {
        name = "obsidian",
        o = { "<cmd>ObsidianOpen<cr>", "Open note" },
        d = { "<cmd>ObsidianDailies -10 0<cr>", "Daily notes" },
        p = { "<cmd>ObsidianPasteImg<cr>", "Paste image" },
        q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick switch" },
        s = { "<cmd>ObsidianSearch<cr>", "Search" },
        t = { "<cmd>ObsidianTags<cr>", "Tags" },
        l = { "<cmd>ObsidianLinks<cr>", "Links" },
        b = { "<cmd>ObsidianBacklinks<cr>", "Backlinks" },
        -- b = { "<cmd>luafile lua/backlinks.lua<cr>", "Backlinks" },
        m = { "<cmd>ObsidianTemplate<cr>", "Template" },
        n = { "<cmd>ObsidianQuickSwitch nav<cr>", "Nav" },
        r = { "<cmd>ObsidianRename<cr>", "Rename" },
        w = { "<cmd>ObsidianWorkspace<cr>", "Workspace" },
        c = {
          function()
            local day_of_week = os.date "%A"
            assert(type(day_of_week) == "string")

            ---@type integer
            local offset_start
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
            assert(offset_start)

            vim.cmd(string.format("ObsidianDailies %d %d", offset_start, offset_start + 4))
          end,
          "Current week",
        },
      },
    }

    wk.register({
      ["<leader>o"] = {
        name = "obsidian",
        e = {
          function()
            local title = vim.fn.input { prompt = "Enter title (optional): " }
            vim.cmd("ObsidianExtractNote " .. title)
          end,
          "Extract text into new note",
        },
        l = {
          function()
            vim.cmd "ObsidianLink"
          end,
          "Link text to an existing note",
        },
        n = {
          function()
            vim.cmd "ObsidianLinkNew"
          end,
          "Link text to a new note",
        },
      },
    }, {
      mode = "v",
    })
  end,
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/mnt/c/Users/matko/Documents/Obsidian Vault",
      },
    },
  },
}

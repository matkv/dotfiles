return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~") .. "/documents/obsidian/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = "~/documents/obsidian/", -- no need to call 'vim.fn.expand' here

    -- Optional, completion.
    completion = {
      -- If using nvim-cmp, otherwise set to false
      nvim_cmp = true,
      -- Trigger completion at 2 chars
      min_chars = 1,
      -- Where to put new notes created from completion. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",
    },

    -- Optional, set to true if you don't want Obsidian to manage frontmatter.
    disable_frontmatter = true,

    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    mappings = {},
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}

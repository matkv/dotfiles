return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- TODO set up lualine to look prettier
      opts.options.theme = "auto"
    end,
  },
}

return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_transparent_background = 2
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#464240" })
    end,
  },
}

return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_mateiral_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

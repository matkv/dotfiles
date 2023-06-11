return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    opts = { background = "light", gruvbox_material_foreground = "mix", gruvbox_material_background = "hard" },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

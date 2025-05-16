return {
  -- Add gruvbox
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_transparent_background = 2

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
        pattern = "gruvbox-material",
        callback = function()
          local api = vim.api
          api.nvim_set_hl(0, "Normal", { bg = "none" })
          api.nvim_set_hl(0, "NormalNC", { bg = "none" })
          api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
          api.nvim_set_hl(0, "CursorLine", { bg = "#464240" })
        end,
      })

      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

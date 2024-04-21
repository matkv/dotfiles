return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      separator_style = "slant",
      right_mouse_command = "BufferLineTogglePin",
      middle_mouse_command = "bdelete! %d",
      buffer_close_icon = '⌧',
      max_name_length = 20,
      tab_size = 20,
      style_preset = require("bufferline").style_preset.no_italic,
    }
  }
}

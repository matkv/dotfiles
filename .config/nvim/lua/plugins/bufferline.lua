return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "buffers",
      numbers = "none",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      max_name_length = 20,
      tab_size = 20,
      middle_mouse_command = "bdelete! %d",
      right_mouse_command = "BufferLineTogglePin",
    },
    highlights = {
      fill = {
        bg = "NONE",
      },
      background = {
        bg = "NONE",
      },
      buffer_selected = {
        fg = "#ffffff",
        bg = "NONE",
        bold = true,
        italic = false,
      },
      buffer_visible = {
        bg = "NONE",
      },
      separator = {
        fg = "#444444",
        bg = "NONE",
      },
      separator_selected = {
        fg = "#61afef",
        bg = "NONE",
      },
      separator_visible = {
        fg = "#444444",
        bg = "NONE",
      },
      modified = {
        fg = "#e5c07b",
        bg = "NONE",
      },
      modified_visible = {
        fg = "#e5c07b",
        bg = "NONE",
      },
      modified_selected = {
        fg = "#e5c07b",
        bg = "NONE",
      },
      duplicate_selected = {
        fg = "#ffffff",
        bg = "NONE",
        italic = true,
      },
      duplicate_visible = {
        fg = "#cccccc",
        bg = "NONE",
        italic = true,
      },
      duplicate = {
        fg = "#777777",
        bg = "NONE",
        italic = true,
      },
    },
  },
}

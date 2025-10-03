return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter", -- Enter accepts, arrows navigate
        -- Tab accepts completion or moves forward in snippets
        ["<Tab>"] = { "snippet_forward", "select_and_accept", "fallback" },
        -- Shift+Tab moves backward in snippets
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        -- Ctrl+Space manually triggers completion
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}

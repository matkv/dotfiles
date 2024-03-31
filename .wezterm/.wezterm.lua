local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Gruvbox dark, medium (base16)"
config.font = wezterm.font("Fira Code")
config.font_size = 11.0

config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

return config


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

config.window_frame = {
	active_titlebar_bg = "rgba(0 0 0 0)",
	inactive_titlebar_bg = "rgba(0 0 0 0)",
}

config.colors = {
	tab_bar = {
		active_tab = {
			fg_color = "#A5A41E",
			bg_color = "#464240",
		},
		inactive_tab = {
			fg_color = "#A5A41E",
			bg_color = "#363636",
		},
		inactive_tab_hover = {
			fg_color = "#E86612",
			bg_color = "#363636",
		},
		new_tab_hover = {
			fg_color = "#E86612",
			bg_color = "#363636",
		},
	},
}

config.initial_rows = 30
config.initial_cols = 110

return config

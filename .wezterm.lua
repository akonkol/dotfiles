-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
wezterm.font("MesloLGS NF", { weight = 'Bold',  size = 13})
config.colors = {
	foreground = "#a0a8cd",
	background = "111111",
	cursor_bg = "#4ca89d",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#a485dd",
	selection_fg = "#11121d",
	ansi = {
		"#06080a",
		"#ee6d85",
		"#95c561",
		"#d7a65f",
		"#7199ee",
		"#917fb4",
		"#38a89d",
		"#4a5057"
	},
-- 	-- brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}


-- using tmux for the time being
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config

local wezterm = require "wezterm"
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = .925
config.font_size = 13
config.color_scheme = "Ibm 3270 (High Contrast) (Gogh)"
config.use_dead_keys = false
config.window_decorations = "RESIZE"
-- fix non-US Mac keyboard layout
config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
	{ key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection' },
	{ key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
}

return config

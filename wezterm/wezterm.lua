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
config.window_background_opacity = .95
config.font_size = 14
config.use_dead_keys = false
config.window_decorations = "RESIZE"
-- fix non-US Mac keyboard layout
config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
	{ key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection' },
	{ key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
	{ key = 'f', mods = 'SHIFT|CTRL', action = wezterm.action.ToggleFullScreen },
	{ key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action.SplitPane { direction = 'Right' } },
	{ key = 'h', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left', },
	{ key = 'l', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right', },
}
return config

-- # Alabaster
-- [colors]
-- foreground = "#cecece"
-- background = "#0e1415"
-- cursor_bg = "#cd974b"
-- cursor_border = "#cd974b"
-- cursor_fg = "#0e1415"
-- selection_bg = "#293334"
-- selection_fg = "#cecece"
--
-- ansi = [
--     "#000000",
--     "#d2322d",
--     "#6abf40",
--     "#cd974b",
--     "#217EBC",
--     "#9B3596",
--     "#178F79",
--     "#cecece"
-- ]
--
-- brights = [
--     "#333333",
--     "#c33c33",
--     "#95cb82",
--     "#dfdf8e",
--     "#71aed7",
--     "#cc8bc9",
--     "#47BEA9",
--     "#ffffff"
-- ]

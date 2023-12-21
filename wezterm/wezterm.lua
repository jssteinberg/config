local wezterm = require "wezterm"
local act = wezterm.action
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-- CONFIG OPTIONS

-- config.window_background_opacity = .9625
config.font_size = 14
config.line_height = 1.1
config.use_dead_keys = false
config.window_decorations = "RESIZE"
-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- fix non-US Mac keyboard layout
config.send_composed_key_when_left_alt_is_pressed = true

config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "C", mods = "SHIFT|CTRL",  action = act.CopyTo "ClipboardAndPrimarySelection" },
	{ key = "V", mods = "SHIFT|CTRL",  action = act.PasteFrom "Clipboard" },
	{ key = "f", mods = "SUPER|CTRL",  action = wezterm.action.ToggleFullScreen },
	{ key = "v", mods = "SHIFT|CTRL",  action = wezterm.action.SplitPane { direction = "Right" } },
	{ key = "s", mods = "SHIFT|CTRL",  action = wezterm.action.SplitPane { direction = "Down" } },
	{ key = "h", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Left", },
	{ key = "l", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Right", },
	{ key = "-", mods = "SUPER",       action = wezterm.action.DecreaseFontSize },
	{ key = "+", mods = "SUPER",       action = wezterm.action.IncreaseFontSize },
	{
		key = "l",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateLastTab,
	},
}

config.colors = {
	tab_bar = {
		background = "#0c0a19",
		active_tab = { bg_color = "#0c0a19", fg_color = "#e9f5e6", },
		inactive_tab = { bg_color = "#0c0a19", fg_color = "#7d78a1", },
		new_tab = { bg_color = "#0c0a19", fg_color = "#afc5c7", },
	},

	foreground = "#e9f5e6",
	-- background = '#0c0a19',
	background = "black",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#80bc5c",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#0c0a19",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#77e138",

	-- the foreground color of selected text
	selection_fg = "#552c6d",
	-- the background color of selected text
	selection_bg = "#e9f5e6",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#afc5c7",

	-- The color of the split lines between panes
	split = "#342c6d",

	ansi = {
		"#1a1636",
		"#bc675c",
		"#80bc5c",
		"#bc985c",
		"#5c80bc",
		"#685cbc",
		"#5cb1bc",
		"#afc5c7",
	},
	brights = {
		"#7d78a1",
		"#d8a69f",
		"#add89f",
		"#d0d89f",
		"#9fb4d8",
		"#a69fd8",
		"#9fd1d8",
		"#e9f5e6",
	},

	-- Arbitrary colors of the palette in the range from 16 to 255
	indexed = { [136] = "#af8700" },

	-- Since: 20220319-142410-0fcdea07
	-- When the IME, a dead key or a leader key are being processed and are effectively
	-- holding input pending the result of input composition, change the cursor
	-- to this color to give a visual cue about the compose state.
	compose_cursor = "orange",

	-- Colors for copy_mode and quick_select
	-- available since: 20220807-113146-c2fee766
	-- In copy_mode, the color of the active text is:
	-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
	-- 2. selection_* otherwise
	copy_mode_active_highlight_bg = { Color = "#000000" },
	-- use `AnsiColor` to specify one of the ansi color palette values
	-- (index 0-15) using one of the names "Black", "Maroon", "Green",
	--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
	-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
	copy_mode_active_highlight_fg = { AnsiColor = "Black" },
	copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
	copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

	quick_select_label_bg = { Color = "peru" },
	quick_select_label_fg = { Color = "#ffffff" },
	quick_select_match_bg = { AnsiColor = "Navy" },
	quick_select_match_fg = { Color = "#ffffff" },
}

return config

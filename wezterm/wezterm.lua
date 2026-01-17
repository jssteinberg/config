local wezterm = require "wezterm"
local act = wezterm.action
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-- CONFIG OPTIONS

config.initial_rows = 40
config.initial_cols = 140
config.window_background_opacity = .95
config.font_size = 14
config.line_height = 1.1
config.use_dead_keys = false
config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 2 }
-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
-- Fix non-US Mac keyboard layout
config.send_composed_key_when_left_alt_is_pressed = true
-- Leader key
config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 1000 }
-- Key bindings
config.keys = {
	{ key = "C", mods = "SUPER",       action = act.CopyTo "ClipboardAndPrimarySelection" },
	{ key = "V", mods = "SUPER",       action = act.PasteFrom "Clipboard" },
	{ key = "f", mods = "SUPER|CTRL",  action = wezterm.action.ToggleFullScreen },
	{ key = "v", mods = "LEADER|CTRL", action = wezterm.action.SplitPane { direction = "Right" } },
	{ key = "s", mods = "LEADER|CTRL", action = wezterm.action.SplitPane { direction = "Down" } },
	{ key = "h", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Left", },
	{ key = "l", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Right", },
	{ key = "k", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Up", },
	{ key = "j", mods = "LEADER|CTRL", action = act.ActivatePaneDirection "Down", },
	{ key = "-", mods = "SUPER",       action = wezterm.action.DecreaseFontSize },
	{ key = "+", mods = "SUPER",       action = wezterm.action.IncreaseFontSize },
	{ key = "x", mods = "LEADER|CTRL", action = act.RotatePanes "Clockwise" },
	{ key = "h", mods = "CMD",         action = wezterm.action.HideApplication },
	-- option cmd h - hide all other windows
	-- { key = "h", mods = "ALT|SUPER",   action = wezterm.action.HideOtherApplications },
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			args = { os.getenv("SHELL"), "-c", "$EDITOR $WEZTERM_CONFIG_FILE" },
		}),
	},
	{
		key = "l",
		mods = "SUPER",
		action = wezterm.action.ActivateLastTab,
	},
	-- Keymap to open a wezterm window running nvim
	{
		key = "e",
		mods = "SUPER",
		action = wezterm.action_callback(function(_, pane)
			local cwd = pane:get_current_working_dir()
			if cwd then
				cwd = cwd.file_path
			else
				cwd = os.getenv("HOME")
			end

			-- Get screen info to center the window
			local screen = wezterm.gui.screens().active
			local screen_width = screen.width
			local screen_height = screen.height

			-- Calculate approximate window dimensions
			-- Font size is 14, line height is 1.1
			local char_width = 14 * 0.6 -- approximate character width
			local char_height = 14 * 1.1 -- line height
			local window_width = 140 * char_width
			local window_height = 40 * char_height

			-- Calculate center position
			local x = math.floor((screen_width - window_width) / 2)
			local y = math.floor((screen_height - window_height) / 2)

			local tab, new_pane, new_window = wezterm.mux.spawn_window({
				cwd = cwd,
				args = { os.getenv("SHELL"), "-l", "-c", "nvim -c 'colorscheme tokyonight'" },
			})

			-- Set position and padding after spawning
			if new_window then
				new_window:gui_window():set_position(x, y)
				new_window:gui_window():set_config_overrides({
					window_padding = {
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
					},
				})
			end
		end),
	},
}

-- COLORS

config.colors = {
	tab_bar = {
		background = "#0c0a19",
		active_tab = { bg_color = "#0c0a19", fg_color = "#ffffff", intensity = "Bold" },
		inactive_tab = { bg_color = "#0c0a19", fg_color = "#7d78a1", },
		new_tab = { bg_color = "#0c0a19", fg_color = "#7d78a1", },
	},

	foreground = "#e9f5e6",
	-- background = "#0c0a19",
	background = "black",
	split = "#342c6d",
	cursor_bg = "#80bc5c",
	cursor_fg = "#000000",
	selection_fg = "#ffffff",
	selection_bg = "#985cbc",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#add89f",
	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#afc5c7",

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
	indexed = { [136] = "#e1a138" },

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
	copy_mode_inactive_highlight_bg = { Color = "#80bc5c" },
	copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

	quick_select_label_bg = { Color = "peru" },
	quick_select_label_fg = { Color = "#ffffff" },
	quick_select_match_bg = { Color = "#3877e1" },
	quick_select_match_fg = { Color = "#ffffff" },
}

return config

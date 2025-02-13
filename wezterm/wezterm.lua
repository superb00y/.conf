local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

local current_dir = os.getenv("PWD") or os.getenv("OLDPWD")

config.default_cwd = current_dir

-- Themes
-- local scheme = "Catppuccin Mocha"
--local scheme = 'Aci (Gogh)'
-- local scheme = "Atelier Lakeside (base16)"
-- local scheme = "Aco (Gogh)"
local scheme = "Afterglow"
-- local scheme = "Alien Blood (Gogh)"
-- local scheme = "AlienBlood"
-- local scheme = "Atelier Heath (base16)"
-- local scheme = "Atom (Gogh)"
-- local scheme = "Night Owl (Gogh)"
-- local scheme = "Atom"
-- local scheme = "Batman"
-- local scheme = "Bamboo Multiplex"
-- local scheme = "Banana Blueberry"
-- local scheme = "Belafonte Night"
-- local scheme = "Belge (terminal.sexy)"
-- local scheme = "Bitmute (terminal.sexy)"
-- local scheme = "Black Metal (base16)"
-- local scheme = "Blazer"
-- local scheme = "Blue Matrix"
-- local scheme = "Breath (Gogh)"
-- local scheme = "Builtin Pastel Dark"
-- local scheme = "BlueBerryPie"
-- local scheme = "Cai (Gogh)"
-- local scheme = "Tokyo Night"
-- local scheme = "Ayu Dark (Gogh)"
config.color_scheme = scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

config.colors = {
	background = scheme_def.background,
	tab_bar = {
		active_tab = {
			bg_color = scheme_def.background,
			fg_color = scheme_def.foreground,
		},
	},
}

config.enable_tab_bar = false
config.tab_bar_at_bottom = false
config.disable_default_key_bindings = true
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.exit_behavior = "Close"

config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.initial_cols = 110
config.initial_rows = 30
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.show_tab_index_in_tab_bar = false
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.scrollback_lines = 10000
config.show_update_window = true
config.use_dead_keys = false
config.unicode_version = 15
config.macos_window_background_blur = 100
config.window_close_confirmation = "NeverPrompt"
-- config.default_cursor_style = "BlinkingBar"
-- config.cursor_blink_rate = 600
-- config.force_reverse_video_cursor = true

config.harfbuzz_features = { "liga=1" }
config.font = wezterm.font({
	family = "FiraMono Nerd Font",
	weight = "Medium",
	stretch = "Normal",
	style = "Normal",
	harfbuzz_features = { "cv29", "cv30", "ss01", "ss03", "ss06", "ss07", "ss09" },
})
config.freetype_load_flags = "NO_HINTING"
config.front_end = "OpenGL" -- WebGpu, OpenGL or Software
config.font_size = 12
config.line_height = 1.1
config.hide_mouse_cursor_when_typing = true

-- add keys mapping
config.keys = {
	{ action = wezterm.action.ActivateCommandPalette, mods = "CTRL|SHIFT", key = "P" },
	{ action = wezterm.action.CopyTo("Clipboard"), mods = "CTRL", key = "C" },
	{ action = wezterm.action.DecreaseFontSize, mods = "CTRL", key = "-" },
	{ action = wezterm.action.IncreaseFontSize, mods = "CTRL", key = "=" },
	{ action = wezterm.action.Nop, mods = "ALT", key = "Enter" },
	{ action = wezterm.action.PasteFrom("Clipboard"), mods = "CTRL", key = "V" },
	{ action = wezterm.action.ResetFontSize, mods = "CTRL", key = "0" },
	{ action = wezterm.action.ToggleFullScreen, key = "F11" },
	-- open new tab
	{
		action = wezterm.action.SpawnCommandInNewTab({ cwd = current_dir }),
		mods = "CTRL|SHIFT",
		key = "T",
	},
	-- close active tab
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	-- open new window ctrl+shift+n
	{
		key = "n",
		mods = "ALT|SHIFT",
		action = wezterm.action.SpawnCommandInNewWindow({ cwd = current_dir }),
	},
	-- rename table title
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- move tab relative to left shift+alt+{
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	-- move tab relative to right shift+alt+}
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
	-- add tab navigation ctrl+PageUp
	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	-- add tab navigation ctrl+PageDown
	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },

	-- add split vertical ctrl+shift+v
	{ key = "v", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- add split horizontal ctrl+shift+h
	{ key = "h", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- delete split ctrl+shift+d
	{ key = "d", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

	-- navigate focus panel up alt+up
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	-- navigate focus panel down alt+down
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	-- navigate focus panel left alt+left
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	-- navigate focus panel right alt+right
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	-- resize panel up alt+shift+up
	{ key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
	-- resize panel down alt+shift+down
	{ key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
	-- resize panel left alt+shift+left
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
	-- resize panel right alt+shift+right
	{ key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
	-- key alt + UpArrow will send string ALT + k
	{ key = "UpArrow", mods = "ALT", action = act.SendKey({ key = "k", mods = "ALT" }) },
	-- key alt + DownArrow will send string ALT + j
	{ key = "DownArrow", mods = "ALT", action = act.SendKey({ key = "j", mods = "ALT" }) },
	-- key alt + LeftArrow will send string ALT + LeftArrow
	{ key = "LeftArrow", mods = "ALT", action = act.SendKey({ key = "LeftArrow", mods = "ALT" }) },
	-- key alt + RightArrow will send string ALT + RightArrow
	{ key = "RightArrow", mods = "ALT", action = act.SendKey({ key = "RightArrow", mods = "ALT" }) },
	-- set for duplicate key vscode shift-alt-up
	{ key = "UpArrow", mods = "SHIFT|ALT", action = act.SendKey({ key = "UpArrow", mods = "SHIFT" }) },
	-- set for duplicate key vscode shift-alt-down
	{ key = "DownArrow", mods = "SHIFT|ALT", action = act.SendKey({ key = "DownArrow", mods = "SHIFT" }) },
	-- set ctrl + v for paste Clipboard
	{ key = "v", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{
		key = "x",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)

				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act.SendKey({ key = "x", mods = "CTRL" }), pane)
			end
		end),
	},
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local sel = window:get_selection_text_for_pane(pane)
			if not sel or sel == "" then
				window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
			else
				window:perform_action(wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }), pane)
			end
		end),
	},
}

-- add mouse keys mapping
config.mouse_bindings = {
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = wezterm.action.StartWindowDrag,
	},
	-- drag drop window CTRL + Mouse Left
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = wezterm.action.StartWindowDrag,
	},
	-- shift-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config

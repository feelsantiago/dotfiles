-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "nord"
-- config.colors = require("cyberdream")
-- config.font = wezterm.font_with_fallback({ "ProggyClean CE Nerd Font Propo", "JetBrains Mono" })
config.font_size = 19
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.95
config.font = wezterm.font("Hack Nerd Font")

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "nord",
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tab_active = {
			"index",
			{ "tab" },
		},
		tab_inactive = { "index", { "tab" } },
		tabline_y = { "datetime" },
		tabline_z = { "domain" },
	},
})

tabline.apply_to_config(config)

config.window_padding = {
	left = 10,
	right = 10,
	top = 15,
	bottom = 15,
}

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Cycle to the next pane
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Next",
		}),
	},
	-- Cycle to the previous pane
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Prev",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

-- and finally, return the configuration to wezterm
return config

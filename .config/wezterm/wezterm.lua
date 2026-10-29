-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "nord"
-- config.colors = require("cyberdream")
-- config.font = wezterm.font_with_fallback({ "ProggyClean CE Nerd Font Propo", "JetBrains Mono" })
config.font_size = 20
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
-- config.font = wezterm.font("MeslolGL Nerd Font")
config.font = wezterm.font("ShureTechMono Nerd Font")
-- config.font = wezterm.font("ZedMono Nerd Font")

-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({
-- 	options = {
-- 		theme = "nord",
-- 	},
-- 	sections = {
-- 		tabline_a = {},
-- 		tabline_b = {},
-- 		tab_active = {
-- 			"index",
-- 			{ "tab" },
-- 		},
-- 		tab_inactive = { "index", { "tab" } },
-- 		tabline_y = { "datetime" },
-- 		tabline_z = { "workspace", "domain" },
-- 	},
-- })
--
-- tabline.apply_to_config(config)

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- config.leader = { key = "a", mods = "CTRL" }
-- config.keys = {
-- 	{
-- 		key = "R",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.PromptInputLine({
-- 			description = "Enter new name for tab",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line then
-- 					window:active_tab():set_title(line)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	-- Cycle to the next pane
-- 	{
-- 		key = "l",
-- 		mods = "LEADER",
-- 		action = wezterm.action({
-- 			ActivatePaneDirection = "Next",
-- 		}),
-- 	},
-- 	-- Cycle to the previous pane
-- 	{
-- 		key = "h",
-- 		mods = "LEADER",
-- 		action = wezterm.action({
-- 			ActivatePaneDirection = "Prev",
-- 		}),
-- 	},
-- 	{
-- 		key = "w",
-- 		mods = "CMD",
-- 		action = wezterm.action.CloseCurrentPane({ confirm = true }),
-- 	},
--
-- 	{
-- 		key = "H",
-- 		mods = "LEADER",
-- 		action = act.AdjustPaneSize({ "Left", 5 }),
-- 	},
-- 	{
-- 		key = "J",
-- 		mods = "LEADER",
-- 		action = act.AdjustPaneSize({ "Down", 5 }),
-- 	},
-- 	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
-- 	{
-- 		key = "L",
-- 		mods = "LEADER",
-- 		action = act.AdjustPaneSize({ "Right", 5 }),
-- 	},
--
-- 	-- Workspace management
-- 	-- Fuzzy-pick / switch workspace
-- 	{
-- 		key = "w",
-- 		mods = "LEADER",
-- 		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
-- 	},
-- 	-- Create new workspace (prompts for name)
-- 	{
-- 		key = "W",
-- 		mods = "LEADER|SHIFT",
-- 		action = act.PromptInputLine({
-- 			description = "Name for new workspace",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line and #line > 0 then
-- 					window:perform_action(
-- 						act.SwitchToWorkspace({ name = line }),
-- 						pane
-- 					)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	-- Rename current workspace
-- 	{
-- 		key = "R",
-- 		mods = "LEADER",
-- 		action = act.PromptInputLine({
-- 			description = "New name for workspace",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line and #line > 0 then
-- 					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	-- Cycle workspaces
-- 	{
-- 		key = "n",
-- 		mods = "LEADER|CTRL",
-- 		action = act.SwitchWorkspaceRelative(1),
-- 	},
-- 	{
-- 		key = "p",
-- 		mods = "LEADER|CTRL",
-- 		action = act.SwitchWorkspaceRelative(-1),
-- 	},
-- }

-- CMD+1..9 -> herdr switch tab (sends herdr prefix ctrl+a, then digit)
config.keys = {}
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.SendString("\x01" .. tostring(i)),
	})
end

-- and finally, return the configuration to wezterm
return config

local wezterm = require("wezterm")

local module = {}

function module.get_config()
	local config = {}
	local keys = {}
	local mouse_bindings = {}
	local launch_menu = {}

	-- Am I on windows?
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		table.insert(launch_menu, {
			label = "PowerShell",
			args = { "powershell.exe", "-NoLogo" },
		})

		-- Lets us copy stuff out a little easier
		mouse_bindings = {
			{
				event = { Down = { streak = 3, button = "Left" } },
				action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
				mods = "NONE",
			},
		}
	end

	-- Actual Config
	config.color_scheme = "AdventureTime"
	config.font = wezterm.font("FiraMono Nerd Font Mono")
	config.font_size = 10
	config.default_cursor_style = "BlinkingBar"
	config.scrollback_lines = 8000
	config.hyperlink_rules = wezterm.default_hyperlink_rules()

	config.launch_menu = launch_menu
	config.keys = keys
	config.mouse_bindings = mouse_bindings

	-- Am i at work?
	local haswork, work = pcall(require, "work")
	if haswork then
		work.apply_to_config(config)
	end

	return config
end

return module

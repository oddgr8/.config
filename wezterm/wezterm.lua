-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.font = wezterm.font("Fira Code")
config.font_size = 15
config.background = {
	{
		source = { Color = "black" },
	},
	{
		source = { File = os.getenv("HOME") .. "/.config/Background.jpeg" },
		-- opacity = 0.05,
		hsb = { brightness = 0.05 },
	},
}
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

if jit and jit.os == "OSX" then
	-- Running on macOS
	config.native_macos_fullscreen_mode = true
end

-- Finally, return the configuration to wezterm:
return config

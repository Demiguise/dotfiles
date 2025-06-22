-- Small shim to the .wezterm directory
-- Should be setup by our script:
local config = require("dotfiles").get_config()

local hasdevice, wezdevice = pcall(require, "wezdevice")
if hasdevice then
	wezdevice.apply_to_config(config)
end

return config

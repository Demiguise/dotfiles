local wezterm = require("wezterm")
local module = {}


function module.get_config_dir()
    return wezterm.config_dir .. '/.wezterm'
end

return module

local wezterm = require("wezterm")
local platform = require('utils.platform')

bindings = {}

if platform.is_win then
    bindings.mouse_bindings = {
        {
            event = { Down = { streak = 3, button = "Left" } },
            action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
            mods = "NONE",
        },
    }
end

return bindings
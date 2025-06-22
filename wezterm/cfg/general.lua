local wezterm = require("wezterm")

return {
    -- behaviours
    automatically_reload_config = true,
    exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
    exit_behavior_messaging = 'Verbose',
    status_update_interval = 1000,

    scrollback_lines = 8000,
    
    hyperlink_rules = wezterm.default_hyperlink_rules()
}
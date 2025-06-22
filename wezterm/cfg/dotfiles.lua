local wezterm = require("wezterm")
local Config = require("utils.config")

local module = {}

function module.get_config()
    require("utils.backdrops")
       :set_images()
       :random()

    require("events.right-status").setup()
    require("events.tab-title").setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })
   
    local config = Config:init()
        :append(require('appearance'))
        :append(require('general'))
        :append(require('bindings'))
        :append(require('fonts'))

    -- Am i at work?
    local haswork, work = pcall(require, "work")
    if haswork then
        config:append(work)
    end

    return config.options
end

return module

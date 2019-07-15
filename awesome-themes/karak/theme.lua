-------------------------------
--  "Karak" awesome theme  --
--    By Andy   --
-------------------------------

local themes_path = "~/dotfiles/awesome-themes/"
local theme_name = "karak"
local theme_folder = themes_path .. theme_name .. "/"
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}
theme.wallpaper = theme_folder .. "background.png"

------------------------------------------------------------------------
-- Styling

theme.font = "sans 8"

------------------------------------------------------------------------
-- Colours

theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal

------------------------------------------------------------------------
-- Borders

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(1)
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"

------------------------------------------------------------------------
-- Titlebars

theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"

------------------------------------------------------------------------
--  Mouse finder

theme.mouse_finder_color = "#CC9393"

------------------------------------------------------------------------
--  Menu

theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

------------------------------------------------------------------------
--  Icons

--  Taglist
theme.taglist_squares_sel   = theme_folder .. "taglist/squarefz.png"
theme.taglist_squares_unsel = theme_folder .. "taglist/squarez.png"
theme.tagnames = {
  "Main",
  "Web",
  "Chat",
  "Term",
  "Files",
  "6",
  "7",
  "8",
  "9",
  "0",
}

-- Misc
theme.awesome_icon           = theme_folder .. "awesome-icon.png"
theme.menu_submenu_icon      = theme_folder .. "default/submenu.png"

-- Layout
theme.layout_tile       = theme_folder .. "layouts/tile.png"
theme.layout_tileleft   = theme_folder .. "layouts/tileleft.png"
theme.layout_tilebottom = theme_folder .. "layouts/tilebottom.png"
theme.layout_tiletop    = theme_folder .. "layouts/tiletop.png"
theme.layout_fairv      = theme_folder .. "layouts/fairv.png"
theme.layout_fairh      = theme_folder .. "layouts/fairh.png"
theme.layout_spiral     = theme_folder .. "layouts/spiral.png"
theme.layout_dwindle    = theme_folder .. "layouts/dwindle.png"
theme.layout_max        = theme_folder .. "layouts/max.png"
theme.layout_fullscreen = theme_folder .. "layouts/fullscreen.png"
theme.layout_magnifier  = theme_folder .. "layouts/magnifier.png"
theme.layout_floating   = theme_folder .. "layouts/floating.png"
theme.layout_cornernw   = theme_folder .. "layouts/cornernw.png"
theme.layout_cornerne   = theme_folder .. "layouts/cornerne.png"
theme.layout_cornersw   = theme_folder .. "layouts/cornersw.png"
theme.layout_cornerse   = theme_folder .. "layouts/cornerse.png"

-- Titlebar
theme.titlebar_close_button_focus  = theme_folder .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme_folder .. "titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = theme_folder .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme_folder .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = theme_folder .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme_folder .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme_folder .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme_folder .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme_folder .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme_folder .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme_folder .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme_folder .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme_folder .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme_folder .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme_folder .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme_folder .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme_folder .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme_folder .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_folder .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_folder .. "titlebar/maximized_normal_inactive.png"

return theme
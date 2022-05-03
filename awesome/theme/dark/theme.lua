-- Standard awesome library
local gears = require("gears")

-- Library
local themes_path = gears.filesystem.get_themes_dir()
local theme = dofile(themes_path .. "default/theme.lua")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()

-- Colorscheme
local color_scheme =
{
    white = "#FFFFFF",
    grey = "#F2F2F2",
    black = "#000000"
}

theme.xbackground = color_scheme.black
theme.xforeground = color_scheme.white
theme.transparent = "#00000000"

-- Font
theme.font_name = "Poppins "
theme.font = theme.font_name .. "8"

-- Wallpaper
theme.wallpaper = gears.filesystem.get_configuration_dir() .. "theme/assets/dark.jpg"

-- Logo
theme.awesome_logo = gears.surface.load_uncached(gears.filesystem.get_configuration_dir() .. "theme/assets/logo.svg")

-- Wibar
theme.wibar_bg = color_scheme.grey
theme.wibar_widget_bg = color_scheme.white

-- Margins
theme.gap = dpi(5)

-- Borders
theme.border_radius = dpi(10)

return theme

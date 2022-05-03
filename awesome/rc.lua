pcall(require, "luarocks.loader")

-- Default Apps
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
code = "code"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
-- ============================
-- Libraries
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi
-- ============================
-- Theme
themes = {
    "light",
    "dark"
}
local theme = themes[2] -- Load light theme
local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")
-- =============================
-- Get screen geometry
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height
-- =============================
-- Config
require("config")
-- =============================
-- Widgets
require("widgets")
-- =============================

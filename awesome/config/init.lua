-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Theme handling library
local beautiful = require("beautiful")

-- Wallpaper
awful.screen.connect_for_each_screen(function(s)
    gears.wallpaper.maximized(
        gears.surface.load_uncached(beautiful.wallpaper),
        s,
        false,
        nil
    )
end)

require("config.extra")
require("config.keys")
require("config.ruled")
require("config.menu")

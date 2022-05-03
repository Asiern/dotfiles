-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Utilities
local utils = require("utils")

awful.screen.connect_for_each_screen(function(s)

    local vertical_separator = wibox.widget({
        orientation = "vertical",
        color = beautiful.wibar_bg,
        forced_height = dpi(1),
        forced_width = dpi(1),
        span_ratio = 0.90,
        widget = wibox.widget.separator,
    })

    local layoutbox = wibox.widget({
        s.mylayoutbox,
        left = dpi(2),
        right = dpi(2),
        top = dpi(3),
        bottom = dpi(3),
        widget = wibox.container.margin,
    })

    -- Bar logo
    local logo = wibox.widget({
        widget = wibox.widget.imagebox,
        image = beautiful.awesome_logo,
        resize = true,
    })

    -- Time
    local time = wibox.widget({

    })

    -- Awesome config

    -- Taglist
    s.taglist = require("widgets.bar.taglist")(s)

    -- IO

    -- Power
    local power_button = wibox.widget({
        widget = wibox.widget.imagebox,
        image = beautiful.awesome_logo,
        resize = true
    })

    -- Left
    local left_container = wibox.widget({
        {
            {
                time,
                vertical_separator,
                layoutbox,
                layout = wibox.layout.fixed.horizontal,
                spacing = dpi(10),
            },
            top = dpi(4),
            bottom = dpi(4),
            left = dpi(8),
            right = dpi(8),
            widget = wibox.container.margin,
        }
    })

    local right_container = wibox.widget({
        {
            power_button,
            logo,
            logo,
            top = dpi(4),
            bottom = dpi(4),
            left = dpi(8),
            right = dpi(8),
            widget = wibox.container.margin,
        }
    })

    -- Create wibar
    s.wibar = awful.wibar({
        type = "dock",
        position = "top",
        screen = 5,
        height = dpi(50),
        width = s.geometry.width - dpi(40),
        bg = beautiful.transparent,
        ontop = true,
        visible = true,
    })

    awful.placement.top(s.wibar, { margins = beautiful.gap * 3 })

    -- Add widgets to wibar
    s.wibar:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                {
                    logo,
                    nil,
                    spacing = dpi(10),
                    layout = wibox.layout.fixed.horizontal,
                },
                {
                    widget = s.taglist
                }
            },
            margins = dpi(10),
            widget = wibox.container.margin,
        },
        bg = beautiful.wibar_bg,
        shape = utils.rounded_rect(beautiful.border_radius),
        widget = wibox.container.background,
    })

    -- Show bar on full screen
    local function show_bar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibar.visible = true
        end
    end

    client.connect_signal("property::unmanage", show_bar)

    -- Hide bar on full screen
    local function hide_bar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibar.visible = false
        else
            c.screen.mywibar.visible = true
        end
    end

    client.connect_signal("property::fullscreen", hide_bar)


end)

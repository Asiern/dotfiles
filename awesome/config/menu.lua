-- Standard Awesome Library
local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    -- Power menu
    powermenu = {
        {
            "Power Off",
            function()
                awful.spawn.with_shell("systemctl poweroff")
            end
        },
        {
            "Reboot",
            function()
                awful.spawn.with_shell("systemctl reboot")
            end
        }
    }
end)

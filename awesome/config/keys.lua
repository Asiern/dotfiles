-- Libraries
local awful = require("awful")

-- Default modkey
modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, ctrl }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, shift }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey }, "x",
        function()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" }),
    awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = "launcher" }),
    awful.key({ modkey }, "q", function() c:kill() end),
    awful.key({ modkey, }, "w", function() awful.spawn.with_shell(browser) end,
        { description = "open browser", group = "launcher" }),
})

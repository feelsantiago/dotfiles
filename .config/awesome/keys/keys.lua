-- My shortcuts for awesomewm
local gears             = require("gears")
local awful             = require("awful")
local naughty           = require("naughty")
local lain              = require("lain")

local menubar           = require("menubar")
local spawn             = awful.spawn

local hotkeys_popup     = require("awful.hotkeys_popup")
local modkey            = "Mod4"

-- swap alt and ctrl (for Emacs reasons)
local altkey            = "Mod1"
local ctrlkey           = "Control"

local home              = os.getenv("HOME")
local terminal          = "alacritty"

-- local terminal        = "wezterm"
local editor            = "vim"
local gui_editor        = "mousepad"
local file_manager      = "nautilus"

local browser           = "qutebrowser"
local private_browser   = browser .. " --incognito"

local rofi_dir          = home .. "/.config/rofi/"

local scripts_dir       = home .. "/.config/myshell/scripts/"
local lockscreen        = "betterlockscreen -l dim"

local get_brightness    = "xbacklight -get"
local volume            = require("awesome-wm-widgets.volume-widget.volume")

menubar.show_categories = false

my_dropdown             = lain.util.quake({
    app = "alacritty",
    argname = '--class %s',
    name = 'dropdown_terminal',
    height = 0.5,
    followtag = true,
    visible = false
})

-- {{{ Key bindings
local globalkeys        = gears.table.join(
    awful.key({ modkey }, "F1", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),

    awful.key({}, "F12", nil,
        function() my_dropdown:toggle() end),

    awful.key({ modkey, }, "Left",
        function() awful.client.focus.bydirection("left") end,
        { description = "view previous", group = "client" }),

    awful.key({ modkey, }, "Right",
        function() awful.client.focus.bydirection("right") end,
        { description = "view previous", group = "client" }),

    awful.key({ modkey, }, "Up",
        function() awful.client.focus.bydirection("up") end,
        { description = "view previous", group = "client" }),

    awful.key({ modkey, }, "Down",
        function() awful.client.focus.bydirection("down") end,
        { description = "view previous", group = "client" }),

    -- awful.key({ modkey, }, "Escape", awful.tag.history.restore,
    -- {description = "go back", group = "tag"}),

    awful.key({ modkey }, "k", function()
        awful.client.focus.bydirection("up")
    end, { description = "focus up", group = "client" }),
    awful.key({ modkey }, "j", function()
        awful.client.focus.bydirection("down")
    end, { description = "focus down", group = "client" }),
    awful.key({ modkey }, "h", function()
        awful.client.focus.bydirection("left")
    end, { description = "focus left", group = "client" }),
    awful.key({ modkey }, "l", function()
        awful.client.focus.bydirection("right")
    end, { description = "focus right", group = "client" }),

    awful.key({ modkey, }, "w",
        function() spawn("rofi -show window") end,
        { description = "show all windows (all workspaces)", group = "awesome" }),

    -- Layout manipulation
    awful.key({ modkey, ctrlkey }, "h",
        function() awful.screen.focus_relative("-1") end,
        { description = "swap prev monitor", group = "client" }),

    awful.key({ modkey, ctrlkey }, "l",
        function() awful.screen.focus_relative("1") end,
        { description = "swap next monitor", group = "client" }),

    -- my edits
    awful.key({ modkey, ctrlkey }, "Left",
        function() awful.client.swap.bydirection("left") end,
        { description = "swap with next client by index", group = "client" }),

    awful.key({ modkey, ctrlkey }, "Right",
        function() awful.client.swap.bydirection("right") end,
        { description = "swap with previous client by index", group = "client" }),

    awful.key({ modkey, ctrlkey }, "Up",
        function() awful.client.swap.bydirection("up") end,
        { description = "swap with next client by index", group = "client" }),

    awful.key({ modkey, ctrlkey }, "Down",
        function() awful.client.swap.bydirection("down") end,
        { description = "swap with previous client by index", group = "client" }),

    awful.key({ modkey, }, "u",
        awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),

    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back to previously focused client", group = "client" }),

    -- Standard program
    awful.key({ modkey, }, "Return",
        function() spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),

    awful.key({ modkey, }, "z",
        awful.tag.history.restore,
        { description = "View previous tag", group = "tag" }),

    awful.key({ modkey, ctrlkey }, "r",
        awesome.restart,
        { description = "reload awesome", group = "awesome" }),

    awful.key({ modkey, "Shift" }, "q",
        awesome.quit,
        { description = "quit awesome", group = "awesome" }),

    awful.key(
        { modkey, 'Shift' },
        'r',
        function()
            awful.spawn('reboot')
        end,
        { description = 'Reboot Computer', group = 'awesome' }
    ),
    awful.key(
        { modkey, 'Shift' },
        's',
        function()
            awful.spawn('shutdown now')
        end,
        { description = 'Shutdown Computer', group = 'awesome' }
    ),
    awful.key(
        { modkey },
        'Escape',
        function()
            awful.spawn(lockscreen)
        end,
        { description = 'Log Out Screen', group = 'awesome' }
    ),

    -- Incremente width
    awful.key({ modkey, altkey }, "l",
        function() awful.tag.incmwfact(0.03) end,
        { description = "increase master width factor", group = "layout" }),

    awful.key({ modkey, altkey }, "h",
        function() awful.tag.incmwfact(-0.03) end,
        { description = "decrease master width factor", group = "layout" }),

    -- Master clients 4X4
    awful.key({ modkey, altkey }, "j",
        function() awful.tag.incnmaster(1, nil, true) end,
        { description = "inc the number of master clients", group = "layout" }),

    awful.key({ modkey, altkey }, "k",
        function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "dec the number of master clients", group = "layout" }),

    -- Add more columns to layout
    awful.key({ modkey, altkey }, "h",
        function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),

    awful.key({ modkey, altkey }, "l",
        function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),

    -- awful.key({ modkey, altkey }, "l",
    --     function() awful.tag.incmwfact(0.01) end,
    --     { description = "increase master width factor 1", group = "layout" }),

    -- awful.key({ modkey, altkey }, "h",
    --     function() awful.tag.incmwfact(-0.01) end,
    --     { description = "decrease master width factor 1", group = "layout" }),

    awful.key({ modkey, "Shift" }, "space",
        function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    -- my_shortcuts {{
    awful.key({ modkey }, "b",
        function() spawn(browser) end,
        { description = "launch Browser", group = "launcher" }),

    awful.key({ modkey, "Shift" }, "b",
        function() spawn(private_browser) end,
        { description = "launch Browser", group = "launcher" }),

    awful.key({ modkey, }, "e",
        function() spawn(file_manager) end,
        { description = "launch filemanager", group = "launcher" }),

    awful.key({ modkey, }, "space",
        function() spawn(rofi_dir .. "scripts/launcher_t1") end,
        { description = "launch rofi", group = "launcher" }),
    awful.key({}, "XF86Calculator", function() spawn("gnome-calculator") end,
        { decription = "launch calculator", group = "launcer" }),

    awful.key({ modkey, altkey }, "b",
        function() spawn(rofi_dir .. "/browser/browser_menu.pl") end,
        { description = "Browser menu ", group = "launcher" }),

    awful.key({}, "Print",
        function() spawn.with_shell('flameshot gui') end,
        { description = "capture a screenshot", group = "screenshot" }),

    awful.key({ ctrlkey }, "Print",
        function() spawn.with_shell('flameshot screen -p ~/Pictures') end,
        { description = "take screenshot of active window", group = "screenshot" }),

    -- modkey + altkey combination of screenshot related keybindings
    awful.key({ modkey, altkey }, "f",
        function() spawn(scripts_dir .. "full-screenshot") end,
        { description = "capture a screenshot", group = "screenshot" }),

    awful.key({ modkey, altkey }, "w",
        function() spawn(scripts_dir .. "window-screenshot") end,
        { description = "take screenshot of active window", group = "screenshot" }),

    awful.key({ modkey, altkey }, "a",
        function() spawn(scripts_dir .. "area-screenshot") end,
        { description = "take screenshot of selection", group = "screenshot" }),

    awful.key({ modkey, altkey }, "g",
        function() spawn(scripts_dir .. "ocr") end,
        { description = "Get OCR text of selection to", group = "screenshot" }),

    awful.key({ modkey, "Shift" }, "c",
        function(c) spawn("xkill") end,
        { description = "xkill", group = "launcher" }),

    -- Show/Hide Wibox
    awful.key({ modkey }, "g", function()
            for s in screen do
                -- set the name in the bar.lua
                s.mywibar.visible = not s.mywibar.visible
            end
        end,
        { description = "toggle wibox", group = "awesome" }),

    -- my_shortcuts ends }}

    awful.key({ modkey, ctrlkey }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Menubar
    awful.key({ modkey }, "y", function() menubar.show() end,
        { description = "show the menubar", group = "launcher" })
)

clientkeys              = gears.table.join(
    awful.key({ modkey, }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, }, "q", function(c) client.focus.kill(c) end,
        { description = "close", group = "client" }),
    awful.key({ modkey, ctrlkey }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),

    awful.key({ modkey, }, ";",
        function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),

    awful.key({ modkey, }, "o",
        function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),

    awful.key({ modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),

    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),

    awful.key({ modkey, ctrlkey }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }),

    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" })

)

-- clientbuttons = gears.table.join(
--     awful.button({}, 1,
--         function(c) client.focus = c; c:raise() mymainmenu:hide() end),
--     awful.button({ modkey }, 1, awful.mouse.client.move),
--     awful.button({ ctrlkey }, 1, awful.mouse.client.resize)
-- )

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.

local np_map            = { 87, 88, 89, 83, 84, 85, 79, 80, 81 }
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. np_map[i],
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),

        -- Toggle tag display.
        awful.key({ modkey, altkey }, "#" .. np_map[i],
            function()
                local screen = awful.screen.focused()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. np_map[i],
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),

        -- This should map on the top row of your keyboard, usually 1 to 9.
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),

        -- Toggle tag display.
        awful.key({ modkey, altkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" })
    )
end

return globalkeys

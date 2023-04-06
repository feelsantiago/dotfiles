local gears     = require("gears")
local awful     = require("awful")
local wibox     = require("wibox")
local dpi       = require("beautiful.xresources").apply_dpi
local volume    = require("awesome-wm-widgets.volume-widget.volume")
local calendar  = require("awesome-wm-widgets.calendar-widget.calendar")
local cpu       = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local docker    = require("awesome-wm-widgets.docker-widget.docker")
local fs        = require("awesome-wm-widgets.fs-widget.fs-widget")
local logout    = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local net_speed = require("awesome-wm-widgets.net-speed-widget.net-speed")
local spotify   = require("awesome-wm-widgets.spotify-widget.spotify")

-- -- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- -- We need one layoutbox per screen.
local LayoutBox = function(s)
    local layoutBox = awful.widget.layoutbox(s)
    layoutBox:buttons(
        awful.util.table.join(
            awful.button(
                {},
                1,
                function()
                    awful.layout.inc(1)
                end
            ),
            awful.button(
                {},
                3,
                function()
                    awful.layout.inc(-1)
                end
            ),
            awful.button(
                {},
                4,
                function()
                    awful.layout.inc(1)
                end
            ),
            awful.button(
                {},
                5,
                function()
                    awful.layout.inc(-1)
                end
            )
        )
    )
    return layoutBox
end

local bar       = function(s, theme)
    local barheight = dpi(22)
    local separator = wibox.container.margin(
        wibox.widget {
            markup  = '|',
            align   = 'center',
            valign  = 'center',
            opacity = 0.3,
            widget  = wibox.widget.textbox
        }
        , dpi(6), dpi(6)
    )


    local clock = wibox.widget.textclock()
    local cw = calendar({
        theme = "nord",
        placement = "top_right",
        start_sunday = true,
        previous_month_button = 1,
        next_month_button = 3,
    })

    clock:connect_signal("button::press",
        function(_, _, _, button)
            if button == 1 then cw.toggle() end
        end)

    local taglist_buttons = gears.table.join(
        awful.button({}, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
        awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
    )

    local mytaglist = awful.widget.taglist(
        s, awful.widget.taglist.filter.all, taglist_buttons
    )

    -- Create the wibox
    -- Name is later used to toggle the bar visiblity
    s.mywibar = awful.wibar({
        position = "top", screen = s, height = barheight, bg = theme.barcolor
    })

    -- Add widgets to the wibox
    s.mywibar:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mytaglist,
        },
        nil,
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spotify({
                play_icon = '/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg',
                pause_icon = '/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg',
                dim_when_paused = true,
                dim_opacity = 0.5,
                max_length = -1,
                show_tooltip = false,
            }),
            separator,
            wibox.layout.margin(wibox.widget.systray(), 3, 3, 3, 3),
            separator,
            docker(),
            separator,
            net_speed(),
            separator,
            cpu({
                width = 70,
                spet_width = 2,
                step_spacing = 0,
                color = "#fff"
            }),
            separator,
            fs(),
            separator,
            LayoutBox(s),
            separator,
            volume {
                widget_type = "arc"
            },
            separator,
            logout({
                onlock = function() awful.spawn("betterlockscreen -l dim") end
            }),
            separator,
            clock,
        },
    }
end

return bar

-- hyprlua.lua — WIP Lua-based Hyprland config (Hyprland 0.55+)
-- This will eventually replace hyprland.conf. Not active yet; building it
-- up incrementally. When complete and renamed to hyprland.lua, Hyprland
-- loads it instead of hyprland.conf.
-- Docs: https://wiki.hypr.land/Configuring/
--
-- STATUS: first-pass translation of hyprland.conf + keybinds.conf.
-- NEEDS VERIFICATION before going live:
--   * monitorv2 HDR / color-management keys (sdrbrightness, supports_hdr,
--     bitdepth, luminance...) — the official example only documents the
--     basic hl.monitor() fields, so these key names are a best guess.
--   * render { cm_fs_passthrough, cm_auto_hdr } mapping.
--   * hl.dsp.exit() — confirm the dispatcher name for "exit".
--   * hl.dsp.window.move({ direction = ... }) for movewindow.

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output    = "HDMI-A-1",
    mode      = "1920x1080@60",
    position  = "0x0",
    scale     = 1,
    transform = 1,
})

-- DP-1: HDR / wide-gamut monitor. These extended keys are translated from
-- the old `monitorv2` block and need to be checked against the wiki.
hl.monitor({
    output              = "DP-1",
    mode                = "3440x1440@164.90",
    position            = "1080x0",
    scale               = 1,
    supports_wide_color = true,
    supports_hdr        = true,
    bitdepth            = 10,
    sdrbrightness       = 1.15,
    sdrsaturation       = 1,
    sdr_min_luminance   = 0.005,
    sdr_max_luminance   = 200,
    min_luminance       = 0,
    max_luminance       = 1000,
    max_avg_luminance   = 200,
})

hl.config({
    render = {
        cm_fs_passthrough = true,
        cm_auto_hdr       = true,
    },
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal      = "ghostty"
local fileManager   = terminal .. " -e yazi"
local menu          = "tofi-drun"
local raycast       = "vicinae"
local browser       = "zen-browser"
local notifications = "swaync-client"
local screenshot    = "hyprshot"
local statusbar     = "ashell" -- waybar


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd(statusbar)
    hl.exec_cmd("steam")
    hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("vicinae server")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 16,

        border_size = 0,

        col = {
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 5,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 9,
            render_power = 9,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 6,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        pseudotile     = true,
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

-- Animation curves / animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}   } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}   } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}      } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}    } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 9.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slide" })


--------------------
---- WORKSPACES ----
--------------------

hl.workspace_rule({ workspace = "special:dockpanel" })
hl.workspace_rule({ workspace = "s[true]", gaps_out = 130, gaps_in = 130 })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = -1.0,

        touchpad = {
            natural_scroll = false,
        },
    },
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.config/hypr/scrips/bt.sh"))
hl.bind(mainMod .. " + Q",   hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C",   hl.dsp.window.close())
hl.bind(mainMod .. " + M",   hl.dsp.exit())
hl.bind(mainMod .. " + E",   hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",   hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",   hl.dsp.window.pseudo())
hl.bind(mainMod .. " + down", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F",   hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N",   hl.dsp.exec_cmd(notifications .. " -t -sw"))
hl.bind(mainMod .. " + O",   hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + R",   hl.dsp.exec_cmd(menu .. " | xargs hyprctl dispatch exec --"))
hl.bind(mainMod .. " + D",   hl.dsp.exec_cmd("vesktop"))

-- Scripts (from keybinds.conf)
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scrips/modes.fish"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("~/.config/hypr/scrips/focus.fish"))

-- Move focus (vim keys)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window (vim keys)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Workspaces: switch + move-to (1-10, key 0 maps to 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- NOTE: original conf also bound SUPER+0 to hyprlock, which conflicts with
-- the workspace-10 switch above. This rebind keeps the original's last-wins
-- behavior — SUPER+0 launches hyprlock, not workspace 10.
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("hyprshot -m region"))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media / volume / brightness
hl.bind(mainMod .. " + F13",     hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                          { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "discord",
    match = { class = "^GPaper$" },
    opacity = 0.3,
    float   = true,
    tile    = false,
})

hl.window_rule({
    name  = "ghostty-opacity",
    match = { class = "^com\\.mitchellh\\.ghostty$" },
    no_blur = true,
})

hl.window_rule({
    name  = "pip",
    match = { title = "^Picture-in-Picture$" },
    float = true,
    pin   = true,
})

hl.window_rule({
    name  = "temple-game",
    match = { class = "^3drogue$" },
    float  = true,
    center = true,
})

hl.window_rule({
    name  = "ambulance-game",
    match = { class = "^paramedics-w-guns$" },
    float  = true,
    center = true,
})

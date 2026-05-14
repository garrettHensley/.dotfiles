#!/usr/bin/env nu

# monitor=HDMI-A-1,1920x1080@60,0x0,1,transform,1

# monitorv2 {
#   output = DP-1
#   mode = 3440x1440@164.90
#   position = 1080x0
#   scale = 1
#   # cm = hdr
#   supports_wide_color = 1
#   supports_hdr = 1
#   bitdepth = 10
#   sdrbrightness = 1.15
#   sdrsaturation = 1
#   sdr_min_luminance = 0.005
#   sdr_max_luminance = 200
#   min_luminance = 0
#   max_luminance = 1000
#   max_avg_luminance = 200
# }
def main [mode: string] {
    # 1. Define your monitor name (find this via 'hyprctl monitors')
    let monitor = "DP-1"
    
    # 2. Define your settings (Resolution, Position, Scale)
    let res_2k = "3440x1440@164.90, 1080x0, 1"
    let res_1080 = "1920x1080@60, 1080x0, 1"

    match $mode {
        "2k" => {
            print $"Switching ($monitor) to 2K..."
            hyprctl keyword monitor $"($monitor), ($res_2k)"
        }
        "1080p" | "1080" => {
            print $"Switching ($monitor) to 1080p..."
            hyprctl keyword monitor $"($monitor), ($res_1080)"
        }
        _ => {
            print "Usage: monitor-switch [2k | 1080p]"
        }
    }
}

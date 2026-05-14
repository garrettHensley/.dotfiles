#!/usr/bin/env fish

#define var here
set -gx HYPRGAMEMODE $(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

echo "hyprgamemode value: $HYPRGAMEMODE"

if test "$HYPRGAMEMODE" = 1
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword animation borderangle,0; \
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
	    keyword decoration:fullscreen_opacity 1;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 0;\
        keyword decoration:rounding 0"
    killall ashell
    hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"
else
    hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"
    hyprctl reload
    ashell &
end

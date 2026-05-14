#!/usr/bin/fish

# Toggle the universal variable directly. Fish handles the saving.
if test "$FOCUS" = "1"
    set -Ux FOCUS 0
else
    set -Ux FOCUS 1
end

# Action logic
if test "$FOCUS" = "1"
    killall -q waybar
    hyprctl notify 1 5000 "rgb(40a02b)" "Focus [ON]"
else
    waybar &
    hyprctl notify 1 5000 "rgb(d20f39)" "Focus [OFF]"
end

exit 0

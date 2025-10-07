#!/bin/bash
#
# If the script is called with "toggle", then we toggle the state
if [ "$1" = "toggle" ]; then
    pkill hypridle || hypridle &
fi

# Check if the hypridle process is running
if pgrep -x "hypridle" > /dev/null; then
    # If it's running, output JSON for the "enabled" state
    printf '{"alt": "disabled", "tooltip": "Hyprland Idle Daemon: Active"}\n'
else
    # If it's not running, output JSON for the "disabled" state
    printf '{"alt": "enabled", "tooltip": "Hyprland Idle Daemon: Inactive"}\n'
fi

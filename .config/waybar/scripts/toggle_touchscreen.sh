#!/bin/bash

# --- Configuration ---
# We use a state file to track the toggle state
STATE_FILE="/tmp/touchscreen.state"

# --- Logic ---

# On first run, assume the device is enabled and create the state file
if [ ! -f "$STATE_FILE" ]; then
    echo "enabled" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

# Function to toggle the device state
toggle_state() {
    if [ "$CURRENT_STATE" = "enabled" ]; then
        # Disable it by passing the raw device name
        hyprctl keyword input:touchdevice:enabled false
        echo "disabled" > "$STATE_FILE"
    else
        # Enable it by passing the raw device name
        hyprctl keyword input:touchdevice:enabled true
        echo "enabled" > "$STATE_FILE"
    fi
}

# --- Script Execution ---

# If the script is called with "toggle", then we toggle the state
if [ "$1" = "toggle" ]; then
    toggle_state
fi

# Finally, always output the current state for Waybar to read
printf '{"alt": "%s"}\n' "$CURRENT_STATE"

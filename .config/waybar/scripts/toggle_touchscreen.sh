#!/bin/bash

# --- Configuration ---
# Your device name from `hyprctl devices`
DEVICE_NAME="elan901c:00-04f3:4250"

# We use a state file to track the toggle state
STATE_FILE="/tmp/touchscreen.state"

# --- Logic ---

# On first run, assume the device is enabled and create the state file
if [ ! -f "$STATE_FILE" ]; then
    echo "enabled" > "$STATE_FILE"
fi

# Function to toggle the device state
toggle_state() {
    # Read the current state from our file
    CURRENT_STATE=$(cat "$STATE_FILE")

    if [ "$CURRENT_STATE" = "enabled" ]; then
        # Disable it by passing the raw device name
        hyprctl dispatch setprop enabled 0 "$DEVICE_NAME"
        echo "disabled" > "$STATE_FILE"
    else
        # Enable it by passing the raw device name
        hyprctl dispatch setprop enabled 1 "$DEVICE_NAME"
        echo "enabled" > "$STATE_FILE"
    fi
}

# --- Script Execution ---

# If the script is called with "toggle", then we toggle the state
if [ "$1" = "toggle" ]; then
    toggle_state
fi

# Finally, always output the current state for Waybar to read
cat "$STATE_FILE"

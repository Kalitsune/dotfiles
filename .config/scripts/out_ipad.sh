#!/bin/bash

# Hardcode the absolute path to bypass systemd's stripped environment
export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /run/user/$(id -u)/hypr | head -n 1)

# Remove the output
hyprctl output remove ipad

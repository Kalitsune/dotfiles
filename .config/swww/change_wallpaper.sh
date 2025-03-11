#!/bin/bash

#start swww
WALLPAPERS_DIR=~/.config/swww/wallpapers
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -name "*.png" -or -name "*.jpg" -or -name "*.gif" \) | shuf -n 1)
swww img "$WALLPAPER"


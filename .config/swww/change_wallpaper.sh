#!/bin/bash

#start swww
WALLPAPERS_DIR=~/.config/swww/wallpapers/vibrant-nature/
CURR_WALLPAPER_PATH=~/.cache/wallpaper.img
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -name "*.png" -or -name "*.jpg" -or -name "*.gif" \) | shuf -n 1)

# Move the current wallpaper to $CURR_WALLPAPERS_PATH
rm $CURR_WALLPAPER_PATH || true
cp "$WALLPAPER" $CURR_WALLPAPER_PATH

# Tell sww to change wallpaper
swww img "$WALLPAPER"

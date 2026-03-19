#!/bin/bash

#start swww
COLLECTION=$(cat ~/.config/swww/.collection)
if [ ! $COLLECTION ]; then
   COLLECTION="vibrant-nature";
   echo -e "$COLLECTION" > ~/.config/swww/.collection;
fi

WALLPAPERS_DIR=~/.config/swww/wallpapers/$COLLECTION
CURR_WALLPAPER_PATH=~/.cache/wallpaper.img
CURR_WALLPAPER_COMPAT="$CURR_WALLPAPER_PATH.png" #for compatibility


WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -name "*.png" -or -name "*.jpg" -or -name "*.gif" \) | shuf -n 1)

# Move the current wallpaper to $CURR_WALLPAPERS_PATH
rm $CURR_WALLPAPER_PATH || true
cp "$WALLPAPER" $CURR_WALLPAPER_PATH
cp "$WALLPAPER" $CURR_WALLPAPER_COMPAT
# Refresh the wallpaper

# Tell sww to change wallpaper 
case $XDG_CURRENT_DESKTOP in
  'GNOME') {
      echo "Refreshing GNOME"
      gsettings set org.gnome.desktop.background picture-uri "file://$CURR_WALLPAPER_COMPAT"
      gsettings set org.gnome.desktop.background picture-uri-dark "file://$CURR_WALLPAPER_COMPAT"
      dconf write /org/gnome/shell/extensions/paperwm/use-default-background false
      sleep 0.25
      dconf write /org/gnome/shell/extensions/paperwm/use-default-background true
    };;

    'Hyprland') {
        swww img "$WALLPAPER"
    };;
esac


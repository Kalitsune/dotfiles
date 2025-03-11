#!/bin/bash

swww-daemon -f xrgb

systemctl --user start change_wallpaper.timer
systemctl --user start change_wallpaper.service

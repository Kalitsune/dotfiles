#!/bin/sh

layout="$(hyprctl devices | rg "active keymap" | head -n 1 | awk -F': ' '{print $2}')"
printf "%s   " "$layout"

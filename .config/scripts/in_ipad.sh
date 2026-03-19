#!/bin/bash

# Export the Hyprland signature so hyprctl works outside your terminal
export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /run/user/$(id -u)/hypr | head -n 1)

# mount the sshd server
iproxy 2222:22 &

# Transfer ports
ssh -p 2222 -R 1701:127.0.0.1:1701 root@127.0.0.1 &

# Create the output
hyprctl output create headless ipad

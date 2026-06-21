#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 "$XDG_RUNTIME_DIR/hypr" 2>/dev/null | head -n 1)

# Create the output (ignore if already exists)
for i in $(seq 1 10); do
    hyprctl --instance 0 output create headless ipad && break
    echo "hyprctl attempt $i failed, retrying..."
    sleep 1
done

# Restart usbmuxd to ensure clean device detection
sudo systemctl restart usbmuxd
sleep 1


# Start iproxy in background (it stays running)
iproxy 2222:22 &

# Wait until sshd is actually accepting connections
echo "Waiting for sshd..."
until ssh -T -p 2222 -o StrictHostKeyChecking=no -o BatchMode=yes -o ConnectTimeout=2 root@127.0.0.1 true 2>/dev/null; do
    sleep 2
done

# Transfer ports
ssh -T -p 2222 -R 1701:127.0.0.1:1701 root@127.0.0.1 \
    -o StrictHostKeyChecking=no -o BatchMode=yes &
ssh -T -p 2222 -R 9001:127.0.0.1:9001 root@127.0.0.1 \
    -o StrictHostKeyChecking=no -o BatchMode=yes &

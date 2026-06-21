#!/bin/bash

for i in $(seq 1 10); do
    hyprctl --instance 0 output remove ipad && break
    echo "hyprctl attempt $i failed, retrying..."
    sleep 1
done

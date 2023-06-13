#!/bin/bash
export WALLS_DIR="$HOME/walls"
wal -i $WALLS_DIR --backend colorz --cols16 --saturate 0.3

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

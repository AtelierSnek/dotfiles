#!/bin/bash
export WALLS_DIR="$HOME/walls"
wal -i $WALLS_DIR --backend wal --cols16 lighten --contrast 1.25 -q

# App Specific Links
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

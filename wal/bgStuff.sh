#!/bin/bash
export WALLS_DIR="$HOME/walls"
wal -i $WALLS_DIR --backend fast-colorthief --cols16

# App Specific Links
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

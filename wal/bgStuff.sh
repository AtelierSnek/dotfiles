#!/bin/bash
export WALLS_DIR="$HOME/walls"
wal -i $WALLS_DIR --backend haishoku --cols16 lighten


# App Specific Links
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

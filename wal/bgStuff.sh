#!/bin/bash
export WALLS_DIR="$HOME/walls"
  wal -i "$WALLS_DIR" --backend haishoku --cols16 dual -a 90 --saturate 0.05


  # App Specific Links
  cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

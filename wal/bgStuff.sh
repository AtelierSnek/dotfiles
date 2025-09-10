#!/bin/bash
export WALLS_DIR="$HOME/walls"
  wal -i $WALLS_DIR --backend haishoku --cols16 darken --contrast 1.0


  # App Specific Links
  cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

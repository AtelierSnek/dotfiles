#!/bin/bash
if [ -d /mnt/data/walls/1440 ]; then
  export WALLS_DIR="/mnt/data/walls/1440"
else
  export WALLS_DIR="$HOME/walls"
fi
wal -i $WALLS_DIR --backend colorz --cols16

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

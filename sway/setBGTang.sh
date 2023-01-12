#!/bin/bash
wal -i /mnt/data/walls/1440/tang.png --backend haishoku
wal-telegram --wal --tiled
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

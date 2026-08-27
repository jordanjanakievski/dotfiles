#!/usr/bin/env bash
# Picks the first image found in ~/Pictures/wallpapers/selected (any filename)
# and sets it as the background. Falls back to a solid color if the folder
# is empty or missing. ~/Pictures/wallpapers itself is just a library you can
# stash candidates in - drop the one you want live into selected/.

WALLPAPER_DIR="$HOME/Pictures/wallpapers/selected"
FALLBACK_COLOR="#191724"

img=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.bmp" \) \
    2>/dev/null | sort | head -n 1)

if [ -n "$img" ]; then
    exec swaybg -m fill -i "$img"
else
    exec swaybg -m fill -c "$FALLBACK_COLOR"
fi

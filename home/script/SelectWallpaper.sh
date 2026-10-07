#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/walls"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"
MAX_CACHE_MB=50

notify_system() {
    local title="$1"
    local body="$2"
    local icon="${3:-dialog-information}"
    notify-send "$title" "$body" -i "$icon" -h string:desktop-entry:system-preferences
}

if [ ! -d "$WALL_DIR" ]; then
    notify_system "Wallpaper Selector" "   Directory ~/Pictures/walls was not found." "dialog-error"
    exit 1
fi

mkdir -p "$CACHE_DIR" || exit 1

if ! pidof awww-daemon > /dev/null; then
    awww-daemon &>/dev/null &
    sleep 0.5 
fi

RAW_INPUT=""
for img in "$WALL_DIR"/*; do
    case "$img" in
        *.jpg|*.jpeg|*.png|*.webp|*.JPG|*.PNG) ;;
        *) continue ;;
    esac

    [ -f "$img" ] || continue
    filename=$(basename "$img")
    thumb="$CACHE_DIR/${filename}.png"

    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
        magick "$img" -thumbnail 256x256 "$thumb" 2>/dev/null
    fi

    RAW_INPUT+="${filename}\0icon\x1f${thumb}\n"
done

if [ -z "$RAW_INPUT" ]; then
    notify_system "Wallpaper Selector" "   No valid images found in your walls folder." "dialog-warning"
    exit 1
fi

SELECTED=$(printf "%b" "$RAW_INPUT" | fuzzel --dmenu --prompt="󰸉 Wallpaper ❯ ")

if [ -z "$SELECTED" ]; then
    exit 0
fi

WP_PATH="$WALL_DIR/$SELECTED"

if [ ! -f "$WP_PATH" ]; then
    notify_system "Wallpaper Selector" "   The requested file is no longer accessible." "dialog-error"
    exit 1
fi

if awww img "$WP_PATH" --transition-type grow --transition-pos center --transition-duration 1 2>/dev/null; then
    notify_system "Desktop Wallpaper" "   Successfully updated to $SELECTED" "$WP_PATH"
else
    notify_system "Wallpaper Selector" "   Internal rendering system failed to apply image." "dialog-error"
    exit 1
fi

CACHE_SIZE_KB=$(du -sk "$CACHE_DIR" | cut -f1)
MAX_CACHE_KB=$((MAX_CACHE_MB * 1024))

if [ "$CACHE_SIZE_KB" -gt "$MAX_CACHE_KB" ]; then
    find "$CACHE_DIR" -type f -name "*.png" -printf '%T+ %p\n' | sort | head -n 15 | cut -d' ' -f2- | xargs rm -f
    notify_system "Storage Management" "   Cleaned up old wallpaper thumbnails to optimize space." "dialog-information"
fi



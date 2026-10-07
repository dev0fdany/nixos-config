#!/usr/bin/env bash

SHUTDOWN="  Shut down"
REBOOT="  Reboot"
LOGOUT="󰗽  Log Out"

OPTIONS="$SHUTDOWN\n$REBOOT\n$LOGOUT"

SELECTION=$(echo -e "$OPTIONS" | fuzzel --dmenu --prompt="  Power ❯ ")

case "$SELECTION" in
    "$SHUTDOWN")
        systemctl poweroff
        ;;
    "$REBOOT")
        systemctl reboot
        ;;
    "$LOGOUT")
        niri msg action quit --skip-confirmation 2>/dev/null || pkill niri || loginctl terminate-user "$USER"
        ;;
    *)
        exit 0
        ;;
esac


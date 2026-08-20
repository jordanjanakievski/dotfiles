#!/bin/bash
lock="Lock"
logout="Logout"
suspend="Suspend"
reboot="Reboot"
poweroff="Power Off"

selected=$(printf '%s\n%s\n%s\n%s\n%s' "$lock" "$logout" "$suspend" "$reboot" "$poweroff" \
    | rofi -dmenu -i -p "Power" -theme ~/.config/rofi/powermenu.rasi)

case "$selected" in
    "$lock")     pidof hyprlock || hyprlock ;;
    "$logout")   hyprctl dispatch exit ;;
    "$suspend")  systemctl suspend ;;
    "$reboot")   systemctl reboot ;;
    "$poweroff") systemctl poweroff ;;
esac

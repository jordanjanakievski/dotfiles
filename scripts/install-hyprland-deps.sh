#!/usr/bin/env bash
# Installs Hyprland and the tools this config depends on
# (waybar, mako, rofi, hypridle, hyprlock, screenshot/media/brightness
# keybind targets, and the Qt "guiutils" dialog helper). Supports Ubuntu
# and Fedora.
set -euo pipefail

. /etc/os-release

case "$ID" in
    ubuntu)
        sudo apt update
        sudo apt install -y \
            hyprland hypridle hyprlock hyprpolkitagent hyprland-qtutils \
            xdg-desktop-portal-hyprland \
            waybar mako-notifier rofi swaybg \
            grim slurp wl-clipboard playerctl brightnessctl \
            wireplumber gnome-settings-daemon qt6ct \
            ghostty
        ;;
    fedora)
        sudo dnf install -y dnf-plugins-core
        sudo dnf copr enable -y sdegler/hyprland
        sudo dnf copr enable -y scottames/ghostty
        sudo dnf install -y \
            hyprland hypridle hyprlock hyprpolkitagent hyprland-guiutils \
            xdg-desktop-portal-hyprland \
            waybar mako rofi swaybg \
            grim slurp wl-clipboard playerctl brightnessctl \
            wireplumber gnome-settings-daemon qt6ct \
            ghostty
        ;;
    *)
        echo "Unsupported distro: $ID (this script supports ubuntu and fedora only)" >&2
        exit 1
        ;;
esac

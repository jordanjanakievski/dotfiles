#!/bin/bash
. /etc/os-release

case "$ID" in
    ubuntu) accent="#e95420" ;;  # Ubuntu orange
    fedora) accent="#3c6eb4" ;;  # Fedora blue
    *)      accent="#ffffff" ;; # fallback, matches the rest of the monochrome theme
esac

cat > ~/.config/waybar/accent.css <<CSS
#workspaces button.active { background-color: ${accent}; color: @base; }
CSS

exec waybar

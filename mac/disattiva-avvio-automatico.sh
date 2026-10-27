#!/bin/bash
# Toglie l'avvio automatico di Remote Control.
# Uso: bash mac/disattiva-avvio-automatico.sh

PLIST="$HOME/Library/LaunchAgents/com.drsantaniello.claude-remote.plist"

launchctl bootout "gui/$(id -u)" "$PLIST" 2>/dev/null || true
rm -f "$PLIST"

echo "Avvio automatico disattivato. Se una finestra di Remote Control è aperta, chiudila con Ctrl+C."

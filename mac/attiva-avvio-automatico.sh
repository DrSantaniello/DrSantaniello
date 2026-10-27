#!/bin/bash
# Fa partire Remote Control da solo ogni volta che accedi al Mac.
# Uso: bash mac/attiva-avvio-automatico.sh
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LABEL="com.drsantaniello.claude-remote"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"
COMMAND="$PROJECT_DIR/mac/avvia-remote-control.command"

chmod +x "$COMMAND"
mkdir -p "$HOME/Library/LaunchAgents"

# Apre una finestra del Terminale con lo script, così vedi lo stato e il QR code
cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$LABEL</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/bin/open</string>
    <string>-a</string>
    <string>Terminal</string>
    <string>$COMMAND</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
EOF

launchctl bootout "gui/$(id -u)" "$PLIST" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$PLIST"

echo "Avvio automatico attivato."
echo "Da ora, a ogni accesso al Mac si apre una finestra del Terminale con Remote Control."
echo "Per disattivarlo: bash mac/disattiva-avvio-automatico.sh"

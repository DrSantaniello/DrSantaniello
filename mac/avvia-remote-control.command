#!/bin/bash
# Tiene Claude Code sempre raggiungibile dall'iPad/iPhone (Remote Control) su questo progetto.
# Se la connessione cade e Claude Code si chiude, lo riavvia da solo.
# Doppio clic per avviarlo a mano; Ctrl+C nella finestra per fermarlo.

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NAME="${CLAUDE_RC_NAME:-DrSantaniello}"
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"

cd "$PROJECT_DIR" || exit 1
trap 'echo; echo "Remote Control fermato."; exit 0' INT TERM

if pgrep -f "claude remote-control" >/dev/null 2>&1; then
  echo "Remote Control è già attivo in un'altra finestra: chiudo questa."
  exit 0
fi

while true; do
  echo "[$(date '+%d/%m %H:%M')] Avvio Remote Control in $PROJECT_DIR"
  # caffeinate impedisce al Mac di andare in stop mentre Claude è in ascolto
  caffeinate -i -s claude remote-control --name "$NAME"
  echo "Remote Control si è chiuso. Riavvio tra 30 secondi (Ctrl+C per fermare)."
  sleep 30
done

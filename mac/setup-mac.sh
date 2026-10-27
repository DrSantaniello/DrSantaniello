#!/bin/bash
# Prepara il Mac per lavorare su questo progetto con Claude Code.
# Uso: dal Terminale, nella cartella del progetto:  bash mac/setup-mac.sh
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if [ "$(uname)" != "Darwin" ]; then
  echo "Questo script va eseguito su un Mac." >&2
  exit 1
fi

echo "==> Cartella del progetto: $PROJECT_DIR"

# 1. Homebrew (gestore dei programmi da terminale)
if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installo Homebrew (ti chiederà la password del Mac)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 2. Strumenti: ffmpeg per i video, git, node (Remotion), uv (strumenti Python come video-use)
echo "==> Installo ffmpeg, git, node e uv"
brew install ffmpeg git node uv

# 3. Claude Code (installer ufficiale, si aggiorna da solo)
if ! command -v claude >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/claude" ]; then
  echo "==> Installo Claude Code"
  curl -fsSL https://claude.ai/install.sh | bash
fi
if ! grep -q '.local/bin' "$HOME/.zshrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
fi
export PATH="$HOME/.local/bin:$PATH"

# 4. Cartelle per i video (escluse da GitHub tramite .gitignore)
mkdir -p "$PROJECT_DIR/media/grezzi" "$PROJECT_DIR/media/finali" "$PROJECT_DIR/contenuti"

# 5. Rende eseguibili gli script del progetto
chmod +x "$PROJECT_DIR"/mac/*.sh "$PROJECT_DIR"/mac/*.command

echo
echo "==> Fatto. Versione di Claude Code:"
claude --version || echo "Apri una nuova finestra del Terminale e scrivi: claude --version"
echo
echo "Prossimo passo (vedi GUIDA-MAC.md, passo 4): accedi con il tuo account Claude:"
echo "  cd \"$PROJECT_DIR\" && claude"

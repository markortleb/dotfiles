#!/usr/bin/env bash

set -e

# .tmux.conf runs ~/.tmux/plugins/tpm/tpm, so tpm has to live at exactly this path.
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  echo "✅ tpm already installed at $TPM_DIR"
else
  echo "📦 Installing tmux plugin manager (tpm) to $TPM_DIR..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "👉 Inside tmux, press prefix + I (capital i) to install the plugins."

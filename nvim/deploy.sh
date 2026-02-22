#!/usr/bin/env bash

echo "Create symbolic link for Neovim."
mkdir -p "$HOME/.config"
if [ -z "${DOTFILES_DIR:-}" ]; then
  exit 2
fi
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
  

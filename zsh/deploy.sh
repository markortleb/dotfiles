#!/usr/bin/env bash

dotfiles=(
  ".zshrc"
)

if [ -z "${DOTFILES_DIR:-}" ]; then
  exit 2
fi


# shellcheck disable=SC2068
for str in ${dotfiles[@]}; do
  
  echo "Create symbolic link for $HOME/$str."
  ln -sfn "$DOTFILES_DIR/zsh/$str" "$HOME/$str"
  
done

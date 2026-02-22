#!/usr/bin/env bash

dotfiles=(
  ".tmux.conf"
)

if [ -z "${DOTFILES_DIR:-}" ]; then
  exit 2
fi


# shellcheck disable=SC2068
for str in ${dotfiles[@]}; do
  
  echo "Create symbolic link for $HOME/$str."
  ln -sfn "$DOTFILES_DIR/tmux/$str" "$HOME/$str"
  
done

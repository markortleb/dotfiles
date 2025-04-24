#!/usr/bin/env bash

dotfiles=(
  ".zshrc"
)


# shellcheck disable=SC2068
for str in ${dotfiles[@]}; do
  
  echo "Create symbolic link for $HOME/$str."
  ln -sf "$HOME/src/dotfiles/zsh/$str" "$HOME/$str"
  
done

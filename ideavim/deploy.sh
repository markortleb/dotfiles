#!/usr/bin/env bash

dotfiles=(
  ".ideavimrc"
)


# shellcheck disable=SC2068
for str in ${dotfiles[@]}; do
  
  echo "Create symbolic link for $HOME/$str."
  ln -sf "$HOME/src/dotfiles/ideavim/$str" "$HOME/$str"
  
done

#!/usr/bin/env bash

dotfiles=(
  ".bashrc"
  ".bash_profile"
  ".profile"
  ".zshrc"
)

mkdir -p "$HOME/.backup_dotfiles"

# shellcheck disable=SC2068
for str in ${dotfiles[@]}; do
  if [[ -L "$HOME/$str" ]]; then
    echo "$HOME/$str is a link, do nothing."
  else
    echo "Backup and create symbolic link for $HOME/$str."
    mv "$HOME/$str" "$HOME/.backup_dotfiles"
    ln -s "$HOME/src/dotfiles/$str" "$HOME/$str"
  fi
done
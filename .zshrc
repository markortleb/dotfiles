export EDITOR=nvim
export VISUAL=nvim


# Use vi keybinds
bindkey -v


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


# My aliases
alias ll='ls -lah'
alias grep='grep --color=auto"'
alias zrc='$EDITOR $HOME/.zshrc'


# My Bindings

# Multiline Command Editor Key Binding
# 
# You can use this when in command mode by pressing ESC and then v.
# To save the command, write and exit the file as you would in vim.
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


PROMPT='%F{green}%n@%F{cyan}%m:%~ %f> '


echo "$(<~/src/dotfiles/hello.txt)"
echo -e "\033[0;36mWelcome \033[0;33mto \033[0;31mMark's \033[0;35mZSH\033[0m!"

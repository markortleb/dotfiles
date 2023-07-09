########################################################################################################################
########################################################################################################################
###  .zshrc  ###########################################################################################################
########################################################################################################################
########################################################################################################################


########################################################################################################################
# Environment Variables ################################################################################################
########################################################################################################################

export EDITOR=nvim
export VISUAL=nvim


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


########################################################################################################################
# Aliases ##############################################################################################################
########################################################################################################################

alias ll='ls -lah'
alias grep='grep --color=auto"'
alias zrc='$EDITOR $HOME/.zshrc'


########################################################################################################################
# Key Bindings #########################################################################################################
########################################################################################################################

# Use vi keybinds
bindkey -v

# Multiline Command Editor Key Binding
# 
# You can use this when in command mode by pressing ESC and then v.
# To save the command, write and exit the file as you would in vim.
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# Search Through History Based on Already Entered Prompt Ket Bindings
#
# For example, this will allow us to type `git` into the command line
# and we can use the up or down arrow key to search through previous
# commands starting with `git`.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # Down


########################################################################################################################

PROMPT='%F{green}%n@%F{cyan}%m:%~ %f> '
RPROMPT='%* %?'


echo "$(<~/src/dotfiles/hello.txt)"

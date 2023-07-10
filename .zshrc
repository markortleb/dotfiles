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
export KEYTIMEOUT=1


########################################################################################################################
# Aliases ##############################################################################################################
########################################################################################################################

alias ll='ls -lah'
alias grep='grep --color=auto"'
alias zrc='$EDITOR $HOME/.zshrc'


source ~/.machine_specific_profile 2>/dev/null



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


# Search Through History Based on Already Entlsered Prompt Ket Bindings
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
# Other Stuff ##########################################################################################################
########################################################################################################################


# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


# Jetbrains Terminal will cut off the first character of each line if we try to set the cursor to be a line
# instead of a block. The best option is to keep the default block terminal cursor when in a Jetbrains terminal and
# use the line cursor when in dedicated terminal emulators. To get this to work, we need to create an environment
# variable in Jetbrains called TERMINAL_TYPE and set it to be 'jetbrains'. Do this in a Jetbrains IDE by going to
# Settings -> Tools -> Terminal and then add the following Environment Variable: TERMINAL_TYPE=jetbrains .
# $IS_JETBRAINS=0
if [[ -z "${TERMINAL_TYPE}" ]]; then
    IS_JETBRAINS=0     # does this if length of TERMINAL_TYPE is 0
else
    if [[ "$TERMINAL_TYPE" == jetbrains ]]; then
        IS_JETBRAINS=1
    else
        IS_JETBRAINS=0
    fi
fi

if [[ $IS_JETBRAINS == "0" ]]; then
    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select
    zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }
    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
fi


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # this will include hidden files


eval "$(starship init zsh)"


# Print welcome letter on new shell
echo "$(<~/src/dotfiles/hello.txt)"

# Path to the dotfiles
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable XDebug for php
export XDEBUG_CONFIG="idekey=VSCODE"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh
# Theme Serrings
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# execution time
HIST_STAMPS="dd/mm/yyyy"

# any plugins to be used
plugins=()


# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

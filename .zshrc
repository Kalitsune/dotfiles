# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME=""

# User configuration

# Setup the env.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY


# $PATH configuration
# note: language-specific paths are located in .config/zsh/tools
path+=("$HOME/.local/bin")
path+=("$HOME/bin")

export EDITOR="nvim"

plugins=(
  git-auto-fetch
  gh # completions
  rust # completions
  thefuck
  nvm # completions
  aliases # `als`: lists the available aliases
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# welcome screen
fetch () {
  eyes=(0 1 2 3 4 6 7 8 11 12 14)
  $ZSH/bin/cutefetch/cutefetch -k2 $(shuf -e "${eyes[@]}" -n 1)
}
fetch

# zoxide (cd command on steroids)
eval "$(zoxide init --cmd cd zsh)"

# load zsh widgets
source $XDG_CONFIG_HOME/zsh/widgets.zsh

# prompt
autoload -U promptinit; promptinit
prompt pure

# completions
autoload -U compinit
compinit

# misc zsh features
autoload -Uz add-zsh-hook

# aliases
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# run tools configuration
source $XDG_CONFIG_HOME/zsh/load_tools.zsh

# export the path, done here so that the tools configs can add stuff to it
export PATH

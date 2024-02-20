# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME=""

# User configuration

# Setup the env.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share/"

# $PATH configuration
path+=("$HOME/.local/bin")
path+=("$HOME/bin")
path+=("$HOME/.local/bin/platform-tools")
path+=("$HOME/.platformio/penv/bin")
path+=("$HOME/.cargo/bin/")
export PATH

export EDITOR="nvim"

plugins=(
  git
  autojump
  thefuck
  aliases
  kubectl
  zsh-autosuggestions
  zsh-syntax-highlighting
  qrcode
)
source $ZSH/oh-my-zsh.sh

# welcome screen
fetch () {
  eyes=(0 1 2 3 4 6 7 8 11 12 14)
  $ZSH/bin/cutefetch/cutefetch -k2 $(shuf -e "${eyes[@]}" -n 1)
}
fetch

# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias fixyubikey="sudo systemctl restart pcscd.service"
alias clear="clear && fetch"

autoload -U promptinit; promptinit
prompt pure

eval "$(zoxide init --cmd cd zsh)"

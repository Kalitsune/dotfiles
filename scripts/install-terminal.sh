#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source $SCRIPT_DIR/utils/env.sh

# Greet the user
echo -e "${BLUE}Setting up the terminal environment...${BLANK}"

# install the packages
source $SCRIPT_DIR/utils/packages-installer.sh

deb_packages="npm zsh thefuck autojump tealdeer fzf neovim python3-neovim tmux"
rhl_packages="npm zsh thefuck autojump-zsh tealdeer fzf neovim python3-neovim tmux"

if [[ "$1" == "--skip-packages" ]]; then
    echo -e "${WARN}Skipping package installation as the --skip-packages option is provided.${BLANK}"
else
    install_packages "$deb_packages" "$rhl_packages"
fi

# Install Oh-my-zsh:
echo -e "${NEUTRAL}Installing Oh-my-zsh...${BLANK}"
echo -e "${WARN}IMPORTANT: IF A SHELL OPENS AFTER FINALISING THE OH-MY-ZSH CONFIG PLEASE ENTER THE `exit` COMMAND${BLANK}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

# install the pure theme
echo -e "${NEUTRAL}Installing pure-prompt...${BLANK}"
sudo npm install --global pure-prompt

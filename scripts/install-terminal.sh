#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source $SCRIPT_DIR/utils/env.sh

# Greet the user
echo -e "${BLUE}Setting up the terminal environment...${BLANK}"

# install the packages
source $SCRIPT_DIR/utils/packages-installer.sh

deb_packages="npm zsh thefuck autojump tealdeer fzf neovim python3-neovim tmux zoxide gh xdpyinfo lsd bat"
rhl_packages="npm zsh thefuck autojump-zsh tealdeer fzf neovim python3-neovim tmux zoxide gh xdpyinfo lsd bat"

if [[ "$1" == "--skip-packages" ]]; then
    echo -e "${WARN}Skipping package installation as the --skip-packages option is provided.${BLANK}"
else
    install_packages "$deb_packages" "$rhl_packages"
fi

# install doist, a todoist cli client
cargo install doist

# Install Oh-my-zsh:
echo -e "${NEUTRAL}Installing Oh-my-zsh...${BLANK}"
RUNZSH="no" CHSH="yes" KEEP_ZSHRC="yes" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

# install the pure theme
echo -e "${NEUTRAL}Installing pure-prompt...${BLANK}"
sudo npm install --global pure-prompt

# install NvChad
echo -e "${NEUTRAL}Installing NvChad...${BLANK}"
git clone https://github.com/NvChad/starter $HOME/.config/nvim
if ! [ -f $HOME/.config/nvim/lua/.kalidotfiles ]; then rm -rf $HOME/.config/nvim/lua/; fi
# install the french language pack 
curl https://github.com/thjbdvlt/spell-fr.vim/releases/download/v0.1.0/fr.utf-8.spl -o $HOME/.config/nvim/fr-utf-8.spl

# install NerdFont
echo -e "${NEUTRAL}Installing JetBrainsMono (NerdFont)...${BLANK}"
mkdir -p "$HOME/.local/share/fonts" 
curl -fLo "$HOME/.local/share/fonts/Jetbrains Mono NerdFont.otf" \
https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

# disable the native gnome emoji picker
dconf write /desktop/ibus/panel/emoji/hotkey "@as []"

# install dash, a gh extension
gh extension install dlvhdr/gh-dash

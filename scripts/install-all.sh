#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils/env.sh
source $SCRIPT_DIR/utils/confirm.sh

# Greet the user
echo -e "${BLUE}Greetings! I'm going to install all of Kalitsune's dotfiles! just give me a bit...${BLANK}"
$SCRIPT_DIR/update.sh

# Start the specialised Install scripts

# start the instlalation of programing languages related dependancies
$SCRIPT_DIR/install-lang.sh "$@" 

# start the installation of the terminal dependancies
$SCRIPT_DIR/install-terminal.sh "$@"

# start the installation of exegol (& docker)
$SCRIPT_DIR/install-exegol.sh "$@"

# start the installation of hyprland
$SCRIPT_DIR/install-hyprland.sh "$@"

# Install GNU stow
source $SCRIPT_DIR/utils/packages-installer.sh
deb_packages="stow"
rhl_packages="stow"

if [[ "$1" == "--skip-packages" ]]; then
    echo -e "${WARN}Skipping package installation as the --skip-packages option is provided.${BLANK}"
else
    install_packages "$deb_packages" "$rhl_packages"
fi

# install the configs ⚠️  will override everything, this is a complete installation
if confirm "${WARN} ⚠️  You choosed the full installation, any conflict will end up in the erasure of your config files. Are you sure you want to proceed?${BLANK}"; then
    echo -e "${GREEN}Proceeding...${BLANK}"
    $SCRIPT_DIR/sync.sh

    # Post install hooks
    echo -e "${BLUE}Running post install hooks...${BLANK}"
    $SCRIPT_DIR/post-setup-hooks.sh
else
    echo -e "${GREEN}✅ Skipped, please copy the config you'd like manually or using stow.${BLANK}"
fi

# Say goodbye
echo -e "${BLUE}The script has ended, goodbye!${BLANK}"

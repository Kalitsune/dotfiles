#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils/env.sh
source $SCRIPT_DIR/utils/confirm.sh

# Greet the user
echo -e "${BLUE}Greetings! I'm going to install all of Kalitsune's dotfiles! just give me a bit...${BLANK}"

# Start the specialised Install scripts

# start the installation of the terminal dependancies
$SCRIPT_DIR/install-terminal.sh $1


# install the configs ⚠️  will override everything, this is a complete installation
if confirm "${WARN} ⚠️  You choosed the full installation, any conflict will end up in the erasure of your config files. Are you sure you want to proceed?${BLANK}"; then
    echo -e "${GREEN}Proceeding...${BLANK}"
    $SCRIPT_DIR/sync.sh
else
    echo -e "${GREEN}✅ Skipped, please copy the config you'd like manually or using stow.${BLANK}"
    $SCRIPT_DIR/update.sh
fi

# Say goodbye
echo -e "${BLUE}The script has ended, goodbye!${BLANK}"

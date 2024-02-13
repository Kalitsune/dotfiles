#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils/env.sh

# Greet the user
echo -e "${BLUE}Greetings! I'm going to install all of Kalitsune's dotfiles! just give me a bit...${BLANK}"

# Init the submodules
git submodule init
git submodule update

# Copy dotfiles
cd $(pwd "$SCRIPT_DIR/../") # Navigate to the root of the repo 
stow .

# Start the specialised Install scripts

# start the installation of the terminal dependancies
$SCRIPT_DIR/install-terminal.sh $1


# Say goodbye
echo -e "${BLUE}The script has ended, goodbye!${BLANK}"

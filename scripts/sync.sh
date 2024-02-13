#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update the repo
$SCRIPT_DIR/update.sh

# Copy dotfiles
cd $(pwd "$SCRIPT_DIR/../") # Navigate to the root of the repo 
stow . --override='./*'

#!/bin/bash

# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source $SCRIPT_DIR/utils/env.sh

# Tmux plugins Setup
if [ -f "$($HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh)" ]; then
  echo -e "${NEUTRAL}Installing tmux plugins...${BLANK}"
  $HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
fi

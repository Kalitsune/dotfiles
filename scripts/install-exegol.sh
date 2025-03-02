if ! command -v docker 2>&1 >/dev/null; then
    echo -e "${GREEN} 🐋 Installing docker...${BLANK}"
    curl -fsSL "https://get.docker.com/" | sh
fi

# instll pipx
source $SCRIPT_DIR/utils/packages-installer.sh

if [[ "$1" == "--skip-packages" ]]; then
    echo -e "${WARN}Skipping package installation as the --skip-packages option is provided.${BLANK}"
else
    install_packages "pipx" "pipx"
fi

# install exegol
pipx install exegol
pipx ensurepath


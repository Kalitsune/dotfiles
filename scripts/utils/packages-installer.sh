#!/bin/bash

# Function to install packages on Debian/Ubuntu-based distributions
install_debian() {
    sudo apt update
    sudo apt install -yqq $1 
}

# Function to install packages on Fedora-based distributions
install_redhat() {
    sudo yum install -yq $1
}

# Function to install packages based on detected distribution
install_packages() {
    echo -e "${NEUTRAL}Installing the packages..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            debian|ubuntu)
                echo -e "${OK}Detected Debian/Ubuntu-based distribution.${BLANK}"
                install_debian "$1"
                ;;
            centos|rhel|fedora)
                echo -e "${OK}Detected Red Hat-based distribution.${BLANK}"
                install_redhat "$2"
                ;;
            *)
                echo -e "${ERROR}Unsupported distribution: $ID"
                echo    "You'll need to install the following packages by hand: $1"
                echo -e "Install these packages, then run this script again, providing the ${BLANK}--skip-packages ${ERROR}argument.${BLANK}"
                exit 1
                ;;
        esac
    else
        echo -e "${ERROR}Unsupported distribution: $ID"
        echo    "You'll need to install the following packages by hand: $1"
        echo -e "Install these packages, then run this script again, providing the ${BLANK}--skip-packages ${ERROR}argument.${BLANK}"
        exit 1
    fi
}

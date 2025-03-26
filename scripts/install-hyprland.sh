# install the configs ⚠️  will override everything, this is a complete installation
if ! command -v dnf 2>&1 >/dev/null; then
    echo -e "${BLUE}⏩ Skipped the hyprland config because it relies on DNF which is not available on this system.${BLANK}"
else
    # Setup the environment
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
    source $SCRIPT_DIR/utils/env.sh

    # Greet the user
    echo -e "${GREEN}Installing Hyprland...${BLANK}"

    # install ghostty
    dnf copr enable -qy pgdev/ghostty
    dnf install -qy ghostty

    # install hyprland & its components
    sudo dnf copr enable -qy erikreider/SwayNotificationCenter
    sudo dnf copr enable -qy solopasha/hyprland
    sudo dnf install -qy hyprland hyprlock hypridle hyprpicker hyprshot hyprsunset swww SwayNotificationCenter cliphist mate-polkit qt5-qtwayland qt6-qtwayland aylurs-gtk-shell2 nwg-look 

    # make a temp build directory
    BUILD_DIR="/tmp/kdotfiles"
    rm -rf $BUILD_DIR
    mkdir -p $BUILD_DIR
    
    # build anyrun
    cd $BUILD_DIR
    # Clone the repository and move to the cloned location
    git clone https://github.com/anyrun-org/anyrun && cd anyrun
    # Build all packages, and install the Anyrun binary
    cargo build --release
    cargo install --path anyrun/
    mkdir -p ~/.config/anyrun/plugins
    # Copy all of the built plugins to the correct directory
    cp target/release/*.so ~/.config/anyrun/plugins

    # go back to the script directory
    cd $SCRIPT_DIR
fi

confirm() {
    # Prompt for confirmation with the provided message
    echo
    echo -en $1
    read -r -p " [Y/n] " response    
    echo 
    case "$response" in
        [yY][eE][sS]|[yY]|"")
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

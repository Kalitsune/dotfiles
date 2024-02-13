confirm() {
    # Prompt for confirmation with the provided message
    echo -en $1
    read -r -p " [Y/n] " response
    case "$response" in
        [yY][eE][sS]|[yY]|"")
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

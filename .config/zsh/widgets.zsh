# open buffer line in editor 
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Clear screen, keep buffer
clear-keep-buffer() {
    clear 
    fetch
    zle reset-prompt
    zle redisplay
}
zle -N clear-keep-buffer
bindkey '^x^l' clear-keep-buffer

# Copy current command to clipboard
copy-command() {
    echo -n $BUFFER | wl-copy
    zle -e "Copied to clipboard"
}
zle -N copy-command
bindkey '^x^c' copy-command

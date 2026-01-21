# typeset -A git_alias_expand=()

# misc
alias gpl="git pull"
alias grh="git reset --hard"
alias grs="git reset --soft"

# git add
alias ga="git add"
alias gaa="ga -A"

# status
alias gs="git status"
alias gss="gs --short"

# commits
alias gc="git commit"
alias gca="git commit --amend --no-edit"

# git_alias_expand+=(
#   "gc"    'git commit -m "|"' # The pipe emoji is where the cursor should go
#   "gfix"  'git commit -m "🐛 |"'
#   "gfeat" 'git commit -m "✨ |"'
#   "gwip"  'git commit -m "🚧 |"'
#   "gdoc"  'git commit -m "📝 |"'
# )

# push
alias gp="git push"
alias gpt="gp --follow-tags"
alias gpf="gp --force-with-lease"
alias gpft="gpf --follow-tags"
alias gptf="gpft"


# # handle git aliases expantion
# git-alias-expand() {
#   # Get the word immediately before the cursor
#   local word="${LBUFFER##* }"
#
#   # Check if that word is in our list
#   if [[ -n "${magic_aliases[$word]}" ]]; then
#     local expansion="${magic_aliases[$word]}"
#
#     # Remove the typed alias from the buffer
#     LBUFFER="${LBUFFER%$word}"
#
#     # Split the expansion into two parts at the '|' marker
#     local prefix="${expansion%%|*}"
#     local suffix="${expansion##*|}"
#
#     # Construct the new line: prefix goes to left of cursor, suffix to right
#     LBUFFER+="$prefix"
#     RBUFFER="$suffix$RBUFFER"
#   else
#       # behave as a regular enter if no pattern are matched.
#       zle accept-line
#   fi
# }
#
# # 3. Register the widget and bind it to the Space key
# zle -N git-alias-expand
# bindkey "^M" git-alias-expand

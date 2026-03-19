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
alias gcamd="git commit --amend --no-edit"
alias gcmrg="git commit -m \"🪼Merged diverging branches\""

# push
alias gp="git push"
alias gpt="gp --follow-tags"
alias gpf="gp --force-with-lease"
alias gpft="gpf --follow-tags"
alias gptf="gpft"


# Format: "trigger" "expansion with | for cursor"
typeset -A ABBREVIATIONS
ABBREVIATIONS=(
  "gcft"  "git commit -m \"🌼 feat: |\""
  "gcfot" "git commit -m \"🌼 feat(|): \""
  "gcfx"  "git commit -m \"🩹 fix: |\""
  "gcfox" "git commit -m \"🩹 fix(|): \""
  "gcch"  "git commit -m \"🧹 chore: |\""
  "gccoh" "git commit -m \"🧹 chore(|): \""
  "gcrf"  "git commit -m \"♻️ refactor: |\""
  "gcrof" "git commit -m \"♻️ refactor(|): \""
  "gcdc"  "git commit -m \"📖 docs: |\""
  "gcdoc" "git commit -m \"📖 docs(|): \""
  "gcts"  "git commit -m \"🧪 test: |\""
  "gctos" "git commit -m \"🧪 test(|): \""
  "gcci"  "git commit -m \"🤖 ci: |\""
  "gccoi" "git commit -m \"🤖 ci(|): \""
)

expand-abbreviation() {
  # Get the word currently behind the cursor
  local last_word="${LBUFFER##* }"
  
  if [[ -n "${ABBREVIATIONS[$last_word]}" ]]; then
    local expansion="${ABBREVIATIONS[$last_word]}"
    
    # Split the expansion at the '|' marker
    local left="${expansion%|*}"
    local right="${expansion#*|}"
    
    # If there was no '|', 'right' will equal the full expansion. 
    # We handle that to ensure it behaves predictably.
    if [[ "$left" == "$expansion" ]]; then
        right=""
    fi

    # Replace the trigger word with the expansion
    LBUFFER="${LBUFFER%${last_word}}${left}${right}"
    
    # Move the cursor back by the length of the 'right' part
    CURSOR=$(( CURSOR - ${#right} ))
  else
    # If no trigger is found, just insert a space as normal
    zle self-insert
  fi
}
zle -N expand-abbreviation
bindkey ' ' expand-abbreviation

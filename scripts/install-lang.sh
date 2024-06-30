# Setup the environment
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source $SCRIPT_DIR/utils/env.sh

# Greet the user
echo -e "${BLUE}Installing the tooling of common languages...${BLANK}"

# Execute all scripts in the languages directory
for f in $SCRIPT_DIR/languages/*.sh; do
  source "$f" 
done


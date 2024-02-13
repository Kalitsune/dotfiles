# Init the submodules
git submodule init
git submodule update

# Copy dotfiles
stow .

# start the installation of the terminal dependancies
./install-terminal.sh

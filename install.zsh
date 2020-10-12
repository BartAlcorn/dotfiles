#!/usr/local/bin/zsh

# installs zplug, this is mandatory. We have to do this before we update .zshrc or Bad Things™ happen.
source $HOME/DotFiles/install_zplug.zsh

# symlink this folder's zshrc to the user home dir
echo "Set .zshrc to be symlinked to zshrc.zsh here."
ln -s $HOME/DotFiles/zshrc.zsh $HOME/.zshrc

# installs everything else, comment out as appropriate.
source $HOME/DotFiles/install_xcode.sh
source $HOME/DotFiles/install_python3.sh
source $HOME/DotFiles/install_brew.sh
source $HOME/DotFiles/install_nvm.sh

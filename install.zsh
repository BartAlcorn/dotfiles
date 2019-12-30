#!/usr/local/bin/zsh
# copy zshrc to user home dir
echo "Set .zshrc to be symlink to zshrc.zsh here."
ln -s $HOME/DotFiles/zshrc.zsh $HOME/.zshrc

# installs everything, comment out as appropriate.
source install_zplug.zsh
source install_xcode.zsh
source install_python3.zsh
source install_brew.zsh
source install_nvm.zsh

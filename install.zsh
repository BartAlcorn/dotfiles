#!/usr/local/bin/zsh

# backup zshrc, if exists
FILE=$HOME/.zshrc
if [[ -f "$FILE" ]]; then
  mv $FILE "${FILE}_backup"
  echo ".zshrc was backed up in home dir"
fi

# symlink this folder's zshrc to the user home dir
echo "Set .zshrc to be symlinked to zshrc.zsh here."
ln -s $HOME/dotfiles/zshrc.zsh $HOME/.zshrc

# installs everything else, comment out as appropriate.
source $HOME/dotfiles/install_xcode.sh
source $HOME/dotfiles/install_brew.sh
# source $HOME/dotfiles/install_nvm.sh

#!/usr/local/bin/zsh

# install Node Version Manager (NVM)
# https://github.com/creationix/nvm

if test ! $(which nvm); then
  echo "Installing Node Versin Manager (NVM)..."
  yes | curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | zsh
else
  echo "Node Versin Manager (NVM) is already installed..."
fi

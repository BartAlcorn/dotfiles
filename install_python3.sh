#!/usr/local/bin/zsh

# Abort on error
# set -e

echo "Installing Python 3 through Homebrew..."
echo
# Install Python through Homebrew
brew install python3

echo "Installing virtualenv package through pip3..."
echo
/usr/local/bin/pip3 install virtualenv

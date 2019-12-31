#!/usr/local/bin/zsh

# Abort on error
set -e

echo "Checking if Homebrew is already installed..."

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! $(which brew); then
  echo "Installing Homebrew..."
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null
else
  echo "Homebrew is already installed..."
fi

echo "Updating and upgrading Homebrew..."
echo
yes | brew update
yes | brew upgrade

brew install ansiweather
brew install awscli
brew install chtf
brew install coreutils
brew install cowsay
brew install figlet
brew install fortune
brew install fzy
brew install gdbm
brew install gettext
brew install git
brew install glfw
brew install go
brew install icu4c
brew install jq
brew install lazydocker
brew install libssh2
brew install libyaml
brew install mongodb
brew install ncurses
brew install oniguruma
brew install openal-soft
brew install openresty
brew install openssl
brew install pcre
brew install pcre2
brew install peco
brew install pkg-config
brew install readline
brew install redis
brew install rust
brew install sqlite
brew install starship
brew install telnet
brew install terraform
brew install yarn
brew install zsh-completions
brew install zsh-history-substring-search
brew install zshdb

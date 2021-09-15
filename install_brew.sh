#!/usr/local/bin/zsh

# Abort on error
# set -e

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

echo "Installing base packages..."
echo
brew install ansiweather
brew install awscli
brew install bazaar
brew install
brew install chtf
brew install cmatrix
brew install coreutils
brew install cowsay
brew install figlet
brew install fortune
brew install func
brew install fzy
brew install fzf
brew install gdbm
brew install gettext
brew install git
brew install glfw
brew install gray
brew install go
brew install htop
brew install iamy
brew install icu4c
brew install jq
brew install lazydocker
brew install libevent
brew install libssh2
brew install libyaml
brew install libzip
brew install lolcat
brew install lua
brew install lua@5.1
brew install luarocks
brew install make
brew install mongodb
brew install mongodb.zip
brew install mongosh
brew install ncurses
brew install node
brew install oniguruma
brew install openal-soft
brew install openssl@1.1
brew install pcre
brew install pcre2
brew install peco
brew install pkg-config
brew install python
brew install readline
brew install redis
brew install sqlite
brew install starship
brew install telnet
brew install terraform
brew install tldr
brew install tmux
brew install utf8proc
brew install xz
brew install yarn
brew install zplug
brew install zsh
brew install zsh-completions
brew install zsh-history-substring-search
brew install zshdb

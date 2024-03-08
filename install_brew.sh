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
brew install
brew install ack
brew install ansiweather
brew install autoconf
brew install automake
brew install awscli
brew install bat
brew install bazaar
brew install broot
brew install brotli
brew install btop
brew install buf
brew install c-ares
brew install ca-certificates
brew install cffi
brew install cmake
brew install cmatrix
brew install coreutils
brew install cowsay
brew install dart
brew install docutils
brew install duf
brew install exa
brew install figlet
brew install fortune
brew install fx
brew install fzf
brew install fzy
brew install gcc
brew install gdbm
brew install gettext
brew install git
brew install glfw
brew install gmp
brew install gnupg
brew install gnutls
brew install gum
brew install hexyl
brew install htop
brew install httpie
brew install icu4c
brew install isl
brew install jq
brew install lazydocker
brew install libassuan
brew install libevent
brew install libgcrypt
brew install libgit2
brew install libgpg-error
brew install libidn2
brew install libksba
brew install libmpc
brew install libnghttp2
brew install libpthread-stubs
brew install libssh2
brew install libtasn1
brew install libtermkey
brew install libtool
brew install libunistring
brew install libusb
brew install libuv
brew install libvterm
brew install libxau
brew install libxcb
brew install libxdmcp
brew install libyaml
brew install libzip
brew install lolcat
brew install lua
brew install lua@5.1
brew install luajit
brew install luarocks
brew install luv
brew install lz4
brew install m4
brew install macos-term-size
brew install mage
brew install make
brew install mongodb-community
brew install mongodb-database-tools
brew install mongosh
brew install mpdecimal
brew install mpfr
brew install msgpack
brew install ncdu
brew install ncurses
brew install nettle
brew install npth
brew install nvm
brew install oniguruma
brew install openal-soft
brew install openldap
brew install openssl@1.1
brew install openssl@3
brew install p11-kit
brew install pcre
brew install pcre2
brew install peco
brew install pinentry
brew install pkg-config
brew install pycparser
brew install pygments
brew install python-certifi
brew install python-setuptools
brew install python@3.12
brew install rbenv
brew install readline
brew install redis
brew install ripgrep
brew install ruby-build
brew install sass
brew install six
brew install sketchybar
brew install sqlite
brew install starship
brew install telnet
brew install terraform
brew install tldr
brew install tmux
brew install tree-sitter
brew install unbound
brew install unibilium
brew install unixodbc
brew install utf8proc
brew install xorgproto
brew install xz
brew install yarn
brew install zplug
brew install zsh
brew install zsh-completions
brew install zsh-history-substring-search
brew install zshdb
brew install zstd

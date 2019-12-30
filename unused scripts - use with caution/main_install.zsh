#!/usr/local/bin/zsh

echo "installing brew (HomeBrew Package Manager)"
# https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "installing Node Version Manager (NVM)"
# https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | zsh

echo "installing powerline font"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo "installing spaceship-prompt"
yarn -global add spaceship-prompt
cd $ZPREZTODIR
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

#!/usr/local/bin/zsh

echo 'installing and configuring zprezto '
echo '(and removing oh-my-zsh, if installed)'

cd ~
if [ -d ".zprezto" ]; then
  echo "Directory .zprezto already exists."
else
  echo "Error: Directory .zprezto does not exists, creating..."
  mkdir ~/.zprezto
fi

cp -a ~/DotFiles/zprezto/. ~/.zprezto/

rm ~/.zshrc

echo "Sym Linking Files..."
ln -sf ~/.zprezto/runcoms/zlogin.zsh ~/.zlogin
ln -sf ~/.zprezto/runcoms/zlogout.zsh ~/.zlogout
ln -sf ~/.zprezto/runcoms/zpreztorc.zsh ~/.zpreztorc
ln -sf ~/.zprezto/runcoms/zprofile.zsh ~/.zprofile
ln -sf ~/.zprezto/runcoms/zshenv.zsh ~/.zshenv
ln -sf ~/.zprezto/runcoms/zshrc.zsh ~/.zshrc

echo "Updating theme"
cd ~/.zprezto/modules/prompt/functions
ln -sf ~/DotFiles/prompt/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup

echo "install fonts"
cp installers/fonts/*.otf ~/Library/Fonts/
cp installers/fonts/*.ttf ~/Library/Fonts/

echo "installing spaceship-prompt"
yarn -global add spaceship-prompt
cd $ZPREZTODIR
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

echo "zprezto ready!"
echo "close this window and open a new iTerm window!"

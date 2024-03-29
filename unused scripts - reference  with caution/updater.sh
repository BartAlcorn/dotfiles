#!/bin/sh
# up - v2 - script to keep your Mac up-to-date (OS, Homebrew, and App Store updates) via the command line

# run thus to to install: cd /usr/local/bin && curl -s -O https://gist.githubusercontent.com/mayel/c07bc0acb91824501d5bdbdc9eb7b33a/raw/08821f64c067327ea68a1a817eb43657db10f10e/up && chmod 755 /usr/local/bin/up
# and then run it anytime by simply entering the command: up

# By https://github.com/mayel based on a script by https://github.com/imwally


# homebrew
echo "Checking for homebrew packages..."
brew update > /dev/null;
new_packages=$(brew outdated --quiet)
num_packages=$(echo $new_packages | wc -w)

if [ $num_packages -gt 0 ]; then
  echo "\n$num_packages New brew updates available:"

  for package in $new_packages; do
    echo "    * $package";
  done

  echo "\nInstall brew updates? (y/n)"
  read answer
  if echo "$answer" | grep -iq "^y" ; then
    brew upgrade && echo "\nBrew updates done!"
  fi

  echo "\nClean up old versions of brew packages? (y/n)"
  read answer
  if echo "$answer" | grep -iq "^y" ; then
    brew cleanup && echo "\nBrew cleanup done!"
  fi

else
  echo "\nNo brew updates available."
fi


# mac app store (requires https://github.com/mas-cli/mas)
echo "\nChecking for Mac App Store updates..."

new_packages=$(mas outdated)
echo $new_packages
num_packages=$(echo $new_packages | wc -w)

if [ $num_packages -gt 0 ]; then

  echo "\nInstall Mac App Store updates? (y/n)"
  read answer
    if echo "$answer" | grep -iq "^y" ; then
    mas upgrade && echo "\nMac App Store updates done!"
  fi

else
  echo "\nNo Mac App Store updates available."
fi


# macOS
echo "\nChecking macOS updates..."
softwareupdate -l

echo "\nInstall macOS updates, if any? (y/n)"
read answer
  if echo "$answer" | grep -iq "^y" ; then
  sudo softwareupdate -i -a && echo "\nmacOS updates done! You may need to reboot..."
fi

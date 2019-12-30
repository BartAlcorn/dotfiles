# dotfiles

Personal dotfiles for easier migration of dev step up.

## Installation

In iTerm2:

`cd $home`

`git clone git@github.com:turnercode/BartAlcorn/dotfiles.git`

In your .zshrc file, also located in your \$HOME directory, add the following:

`# Load zsh config and extra files`

`for config_file ($HOME/DotFiles/configs/*.zsh) source $config_file`

All aliases and other goodies will be available on all **new** iTerm windows.

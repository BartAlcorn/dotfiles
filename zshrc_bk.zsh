#!/usr/local/bin/zsh
# @author Bart Alcorn <bart.alcorn@gmail.com>
# @repo github.com/bartalcorn/dotfiles

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

echo "Starting ZSH..."
echo $YELLOW"I really should put an Insta-Prompt here."$NOCOLOR
echo $GREEN">"$NOCOLOR

# init zplug
source ~/.zplug/init.zsh

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
  zplug install
fi

# Init zplug
export ZPLUG_HOME=~/.zplug #  manually installed zplug
source $ZPLUG_HOME/init.zsh

zplug "modules/environment", from:prezto, defer:0
zplug "modules/bundler", from:prezto
# zplug "modules/directory", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/spectrum", from:prezto
# zplug "modules/homebrew", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/utility", from:prezto

# oh-my-zsh Plugin
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-apple-touchbar"
zplug "zsh-users/zsh-history-substring-search"

zplug "b4b4r07/enhancd", use:init.sh # not working see below
zplug "laggardkernel/zsh-iterm2", use:init.zsh
zplug "gimbo/iterm2-tabs.zsh", use:iterm2-tabs.zsh
zplug "djui/alias-tips", use:alias-tips.plugin.zsh

# SpaceShip-Prompt Settings
SPACESHIP_TIME_SHOW=true
SPACESHIP_AWS_SHOW=false
SPACESHIP_GOLANG_SHOW=true
SPACESHIP_TERRAFORM_SHOW=true
SPACESHIP_BATTERY_SHOW=always
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# export STARSHIP_CONFIG=~/.config/starship.toml
# eval "$(starship init zsh)"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

# Load zplug
zplug load # --verbose

# == End Zplug ==

# Load zsh configs and extra files
for config_file in $HOME/dotfiles/configs/*.zsh; do source $config_file; done

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export EDITOR='code'

# Turner specific Environment Variable
export COMPASS_ENV=local
export NODE_ENV=development
export BABEL_ENV=$NODE_ENV

# Path
export PATH="$PATH"

# Serverless
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . $HOME/.nvm/versions/node/v10.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

clear
# echo "Bartman" | figlet -f big
echo -ne $FG[yellow]$FX[bold]"\n\nOnDemand Fools\n\n"
echo $FG[red]$FX[bold]"WHY be consistent?!?"

# zsh options
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst

# per directory configs
function chpwd() {
  if [ -r $PWD/.zsh_config.zsh ]; then
    source $PWD/.zsh_config.zsh
  # else
  #   print "no .zsh_config.zsh found."
  #   source $HOME/.zshrc
  fi
}

# fuzzy
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo ""
mouse_battery

#!/usr/local/bin/zsh
# @author Bart Alcorn <bart.alcorn@gmail.com>
# @repo github.com/bartalcorn/dotfiles

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1;

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light knu/zsh-manydots-magic

# Add in snippets
zinit snippet OMZ::plugins/golang/golang.plugin.zsh
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet PZTM::spectrum

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# SpaceShip-Prompt Settings
SPACESHIP_TIME_SHOW=true
SPACESHIP_AWS_SHOW=false
SPACESHIP_GOLANG_SHOW=true
SPACESHIP_TERRAFORM_SHOW=true
SPACESHIP_BATTERY_SHOW=always
export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"
zinit light denysdovhan/spaceship-prompt

# Load zsh configs and extra files
for config_file in $HOME/dotfiles/configs/*.zsh; do source $config_file; done

export EDITOR='code'
export NODE_ENV=development
export PATH="$PATH"

# zsh options
HISTFILE=~/.zsh_history # where to store zsh config
HISTSIZE=50000
SAVEHIST=10000
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

# Changing directories
setopt AUTO_CD
setopt AUTO_PUSHD
unsetopt PUSHD_IGNORE_DUPS
setopt PUSHDMINUS

# Completion
setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD
unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Other
setopt PROMPT_SUBST

# per directory configs
function chpwd() {
  if [ -r $PWD/.chpwd.zsh ]; then
    source $PWD/.chpwd.zsh
  fi
}

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

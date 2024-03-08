#!/usr/local/bin/zsh
# @author Bart Alcorn <bart.alcorn@gmail.com>
# @repo github.com/bartalcorn/dotfiles

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

# echo $GREEN"Starting ZSH..."$NOCOLOR
# echo $YELLOW"I really should put an Insta-Prompt here."$NOCOLOR
# echo $GREEN">"$NOCOLOR

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" &&
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

# zinit light zinit-zsh/z-a-as-monitor
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-apple-touchbar
zinit light knu/zsh-manydots-magic
zinit light ogham/exa

# zinit snippet OMZ::plugins/history/history.plugin.zsh
# zinit snippet OMZ::lib/completion.zsh
# zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zinit for \
  djui/alias-tips \
  laggardkernel/zsh-iterm2 \
  PZT::modules/osx \
  PZT::modules/terminal \
  PZT::modules/utility

# SPACESHIP-PROMPT
zinit light spaceship-prompt/spaceship-prompt
zinit load chrissicool/zsh-256color

# zinit load psprint/xzmsg

# Plugins
zinit ice depth=1 lucid
zinit light trystan2k/zsh-tab-title

zinit ice depth=1 wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice depth=1 wait lucid
zinit light Aloxaf/fzf-tab

# Load zsh configs and extra files
for config_file in $HOME/DotFiles/configs/*.zsh; do source $config_file; done

export EDITOR='code'
export PATH="$PATH"

# echo "Bartman" | figlet -f big
# echo -ne $FG[cyan]$FX[bold]"\nA"$FX[none]"sset "$FG[cyan]$FX[bold]"W"$FX[none]"ork"$FG[cyan]$FX[bold]"f"$FX[none]"low "$FG[cyan]$FX[bold]"M"$FX[none]"anagement: "$FG[cyan]" AWfM\n"
# echo -ne $FG[yellow]$FX[bold]"OnDemand Fools\n"
# echo $FG[red]$FX[bold]"WHY be consistent?!?"

# zsh options
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=50000
SAVEHIST=10000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

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

# Enable completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion::complete:*' cache-path
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt PROMPT_SUBST

# per directory configs
function chpwd() {
  if [ -r $PWD/.zsh_config.zsh ]; then
    source $PWD/.zsh_config.zsh
  fi
}

# Node Version Manager
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Ruby Version Manager
# eval "$(rbenv init -)"

# PGP Agent
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

echo ""
mouse_battery

# source /Users/balcorn/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/balcorn/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
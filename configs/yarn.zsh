#
# Yarn aliases
# Bart Alcorn
#

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias ya='yarn add'
alias yb='yarn build'
alias yg='yarn global add'
alias ygr='yarn global remove'
alias yi='yarn install'
alias yr='yarn remove'
alias ys='yarn start'
alias yt='yarn test:lint'

# yarn dev
function yd() {
  clear
  echo $FG[gray]"running "$FG[cyan]$FX[bold]"yarn dev"$FX[none]
  yarn dev
}
# yarn outdated
function yod() {
  clear
  yarn outdated
}
# yarn interactive upgrader
function yodi() {
  clear
  yarn upgrade-interactive --latest
}

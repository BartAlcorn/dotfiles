#
# ZSH functions
# Bart Alcorn
#

function reloadZsh() {
  clear
  . $HOME/.zshrc
  echo $FG[cyan]$FX[bold]'ZSH config reloaded from $HOME/.zshrc'$FX[none]
}

# display who is using a given port (eg 80 or 5858)
function whoHasPort() {sudo lsof -i :$1}

# Make a new file and open it in default editore.
function etouch() {
  touch $1
  $EDITOR $1
}

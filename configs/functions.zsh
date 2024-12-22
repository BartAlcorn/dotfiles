#
# ZSH functions
# Bart Alcorn
#

function sshup() {
  ssh-add --apple-use-keychain ~/.ssh/wbd-msc
  ssh-add --apple-use-keychain ~/.ssh/wbd-streaming
}

function reloadZsh() {
  clear
  . $HOME/.zshrc
  echo $FG[yellow]$FX[bold]'ZSH config reloaded from $HOME/.zshrc'$FX[none]
}

# display who is using a given port (eg 80 or 5858)
function whoHasPort() {sudo lsof -i :$1}

# Make a new file and open it in default editore.
function etouch() {
  touch $1
  $EDITOR $1
}

function myip() {
  local public=$(dig @resolver4.opendns.com myip.opendns.com +short)
  local wired=$(ipconfig getifaddr en1)
  local ether=$(ipconfig getifaddr en0)
  echo "Public: $public"
  echo "Wired : $wired"
  echo "Ether : $ether"
}

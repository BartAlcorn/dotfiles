#!/bin/zsh
# who is user?

# Current User
USR=$(id -un)
# load additional libraries
source /Users/$USR/DotFiles/scripts/spectrum.zsh

# Script conveniences
dot="$FG[yellow]$FX[bold]▸ $FG[white]"

ask() {
  echo "$FG[yellow]$FX[bold] $@ $FX[none]"
}

askSecret() {
  echo "$FG[red]$FX[bold] $@ $FX[none]"
}

alert() {
  echo "$BG[red]$FG[white]$FX[bold]  $@  $FX[none]"
}

#
# body
#
ask "What would you like it to be?"
read computer_name
echo ""

askSecret "Tell me a secret?"
read -s secret
echo ""

#Ask for the administrator password upfront and keep alive
if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
then
    echo "${dot}$FG[cyan]$FX[bold]Some of these settings are system-wide, therefore we need your permission."
    sudo -v
    alert "sudo is now set!"
else
    alert "sudo is set!"
fi

echo "$FG[white]we are on computer $FG[cyan]$computer_name$FG[white] and your secret is $secret$FX[none]\n"
echo "${dot}current user is $FG[yellow]$USR\n\n"

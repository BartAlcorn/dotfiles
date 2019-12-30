#!/usr/local/bin/zsh
# who is user?

# Current User
user=$(id -un)

# Script's color palette
# reset="\033[0m"
# highlight="\033[42m\033[97m"
# dot=$FG[yellow]$FX[bold]"▸"$FX[none]
# dim="\033[2m"
# bold="\033[1m"

# Prints out a step, if last parameter is true then without an ending newline
step() {
    if [ $# -eq 1 ]; then
        echo "${dot}$@"
    else
        echo "${dot}$@"
    fi
}

echo "What would you like it to be? $bold"
read $FG[yellow]$FX[blink]computer_name
echo $FX[none]

echo "Tell me a secret? $bold"
read -s secret
echo $FX[none]

echo $FG[yellow]$FX[blink]"we are on computer $computer_name and your secret is $secret"$FX[none]

# Ask for the administrator password upfront
# if [ $(sudo -n uptime 2>&1|grep "load"|wc -l) -eq 0 ]
# then
#     step "Some of these settings are system-wide, therefore we need your permission."
#     sudo -v
#     echo ""
# else
#     echo "sudo is set"
# fi

step "current user is $user"

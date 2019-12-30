#!/usr/local/bin/zsh
# parameters:
# $1 = new name
sudo scutil --set ComputerName "$1"
# scutil --get ComputerName
sudo scutil --set HostName "$1"
# scutil --get HostName
sudo scutil --set LocalHostName "$1"
# scutil --get LocalHostName
dscacheutil -flushcache

#
# Directory manipulation scripts
# Bart Alcorn
#

# Dir Stacks  dirs -v
function xd() {
  if [ -z "$1" ]; then
    dirs -v
  else
    ~$1
  fi
}

# Create a new directory and change to it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

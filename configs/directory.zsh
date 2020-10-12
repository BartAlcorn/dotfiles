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

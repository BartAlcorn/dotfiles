#
# Screen Capture Utils
# Bart Alcorn
#

alias capc="screencapture -c"
alias capic="screencapture -i -c"
alias capiwc="screencapture -i -w -c"

CAPTURE_FOLDER="$HOME/Desktop"

function cap() {
  screencapture "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

function capi() {
  screencapture -i "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

function capiw() {
  screencapture -i -w "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

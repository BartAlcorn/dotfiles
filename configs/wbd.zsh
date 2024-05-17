#
# Warner Bros Discovery Specific aliases
# Bart Alcorn
#

alias ~lw='$HOME/Projects/GO/src/wbd-msc/lasso-ccds'
alias ~lwh='$HOME/Projects/GO/src/wbd-msc/lasso-web-hda'
alias ~lwu='$HOME/Projects/GO/src/wbd-msc/lasso-web-ui'

function sshup() {
  ssh-add --apple-use-keychain ~/.ssh/wbd-msc
  ssh-add --apple-use-keychain ~/.ssh/wbd-streaming
}

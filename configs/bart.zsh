#
# Bart's personal ZSH Aliases
# Bart Alcorn
#

# See http://misc.flogisoft.com/bash/tip_colors_and_formatting
# for echo coloring and other syntax help

# Bart conveniences
alias editaliases='$EDITOR $HOME/DotFiles/configs'
alias editzsh='$EDITOR $HOME/DotFiles/'
alias editzshrc='$EDITOR $HOME/DotFiles/zshrc.zsh'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Because clear just wasn't short enough
alias clr='clear'

# Folders Shortcuts
alias dl='cd $HOME/Downloads'
alias dk='cd $HOME/Desktop'
alias dt='cd $HOME/DotFiles'

alias ~ba='$HOME/Projects/GIT/'
alias ~ba='$HOME/Projects/GO/src/github.com/bartalcornn'
alias ~bw='$HOME/Projects/GIT/github.com/bartalcorn/bartweb'
alias ~ctm='$HOME/Projects/GO/src/continuum'
alias ~gh='$HOME/Projects/GO/src/github.com'
alias ~gopo='$HOME/Projects/GO/src/github.com/bartalcorn/goponents'
alias ~gt='$HOME/Projects/GIT && oo'
alias ~gwm='$HOME/Projects/GIT/git.wmedia.tech'
alias ~mnt='code $HOME/Projects/GIT/github.com/mantinedev/mantine'
alias ~wgx='$HOME/Projects/GO/src/github.com/bartalcorn/wgx'

# Commands Shortcuts
alias e='$EDITOR'
alias e.='$EDITOR .'
alias x+='chmod +x'

# Open aliases
alias o='open'
alias oo='open .'

alias rm='rm -i'

# *nix List command aliases
alias hidden='ls -a | grep "^\."'
#####  see exa.zsh
# alias ls='ls -Gl'
# alias ll='ls -alF'
# alias la='ls -Al'
# alias l='ls -CF'

# Clipboard tools
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'

# Color conversion
alias hex2hsl='color.js $1 $2'
alias hex2rgb='color.js --rgb $1 $2'

# My IP
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Password generator
# Generate random password, copies it into clipboard and outputs it to terminal
alias password='openssl rand -base64 32'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias fetch='curl -O -L'

# Battery status
alias battery="system_profiler SPPowerDataType"

# Vacum Mail.app for speed up
alias vacumMail='sqlite3 ~/Library/Mail/V5/MailData/Envelope\ Index vacuum;'

# flush dns caches
alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say "dns has been flushed"'

# invokes software update, reboots if successful
alias updateSystem='sudo sh -c "softwareupdate -ia && reboot"'

# open .sh files in code (VSCode)
alias -s sh=code

alias starwars='telnet towel.blinkenlights.nl'

function deleteAllNode() {
    echo $FG[yellow]$FX[bold]"Deleting all 'node_modules' folders recursively downward..."$FX[none]
    find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

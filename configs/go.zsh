# == GO Environment Variables ==
export GOPATH=$HOME/Projects/GO
export GOTOOLDIR=$HOME/.gobrew/current/bin
export GO111MODULE=on
export GOPROXY=direct
# paths that we should explicitly NOT use the proxy for
# export GONOPROXY=github.com/turnercode
# Get libs from Proxy if available, otherwise direct from the repo
# export GOPROXY=https://goproxy.io,direct
# Anything TurnerCode should be private
# export GOPRIVATE=github.com/turnercode
# == End GO Environment Variables ==

export PATH="$HOME/Projects/GO/bin:$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"

alias ~go='$GOPATH'
alias ~gosrc='$GOPATH/src'
alias ~got='$HOME/Projects/GO/src/github/bartalcorn/gothat'
alias ~gow='$HOME/Projects/GO/src/github/bartalcorn/goweb'

alias installgobrew='curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh'
alias upgobrew='gobrew self-update'

alias upair='go install github.com/air-verse/air@latest'

alias gb='gobrew'
alias gbl='gobrew ls'
alias gbr='gobrew ls-remote'
alias gbi='gobrew install'
alias gbu='gobrew use'
alias grm='go run main.go'
alias gmt='go mod tidy'
alias godoclocal='godoc -http :6000 & sleep 4 && open -a "Google Chrome" http://localhost:6000/pkg'

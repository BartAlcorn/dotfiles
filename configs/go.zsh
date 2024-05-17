# == GO Environment Variables ==
export GOPATH=$HOME/Projects/GO
export GOTOOLDIR=$HOME/.gobrew/current/bin
export GO111MODULE=on
# Get libs from Proxy if available, otherwise direct from the repo
# export GONOPROXY=github.com/wbd-streaming
# export GOPROXY=https://gocenter.io,direct
# Anything TurnerCode should be private
# export GOPRIVATE=github.com/wbd-streaming
# == End GO Environment Variables ==

export PATH="$HOME/Projects/GO/bin:$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH:./bin"

alias ~go='$GOPATH'
alias ~gosrc='$GOPATH/src'

alias installair='curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin'
alias installgobrew='curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh'

alias updair='go install github.com/cosmtrek/air@latest'
alias uptempl='go install github.com/a-h/templ/cmd/templ@latest'
alias updgobrew='gobrew self-update'

alias gb='gobrew'
alias gbl='gobrew ls'
alias gbr='gobrew ls-remote'
alias gbi='gobrew install'
alias gbu='gobrew use'
alias grm='go run '
alias grm='go run main.go'
alias gmt='go mod tidy'
alias godoclocal='godoc -http :6000 & sleep 4 && open -a "Google Chrome" http://localhost:6000/pkg'

# function air() {
#   if [[ ${PWD##*/} != src ]]; then
#     cd ./src
#   fi
#   $GOPATH/bin/air
# }

function makego() {
  clear
  if [ "$1" = "" ]; then
    echo $FG[red]$FX[bold]"You must name the package!"
    echo $FG[cyan]"make "$FG[white]$FX[bold]"<packagename> <filename "$FX[none]$FG[grey]"optional"$FG[white]$FX[bold]">"
  else
    mkdir $1 && cd $1
    if [ "$2" = "" ]; then
      touch main.go
    else
      mkdir "cmd"
      mkdir "lambdas"
    fi
    oo
    e.
  fi
}

func syncversion() {
  srcv=$(cat ./internal/app/VERSION.txt)
  clientv=$(jq -r .version ./client/package.json)

  if [ "$srcv" != "$clientv" ]; then
    echo "Upgrading src/internal/app/VERSION.txt"
    echo $clientv > ./src/internal/app/VERSION.txt
  fi
}

function buildui() {
  if ! ok=$(git diff --exit-code ./client); then
    echo "Rebuild React"
  fi
}
# == GO Environment Variables ==
export GOPATH=$HOME/Projects/GO
export GOROOT="$(brew --prefix golang)/libexec"
export GO111MODULE=on
# paths that we should explicitly NOT use the proxy for
export GONOPROXY=github.com/turnercode
# Get libs from Proxy if available, otherwise direct from the repo
export GOPROXY=https://goproxy.io,direct
# Anything TurnerCode should be private
export GOPRIVATE=github.com/turnercode
# == End GO Environment Variables ==

export PATH="$HOME/Projects/GO/bin:$PATH"

alias ~go='$GOPATH'
alias ~gosrc='$GOPATH/src'

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

alias grm='go run main.go'
alias godoclocal='godoc -http :6000 & sleep 4 && open -a "Google Chrome" http://localhost:6000/pkg'

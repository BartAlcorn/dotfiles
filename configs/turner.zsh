#
# Turner Specific aliases
# Bart Alcorn
#

alias tf='terraform'
alias fsi='fargate service info'
alias tfkeys='terraform state show aws_iam_access_key'

alias ~pj='$HOME/Projects'

alias api='$HOME/turnercode/mss-sead-plenitudo-api && oo && e. && echo -ne "\e]1;Compass-API\a"'
alias ~ci='$HOME/Projects/COMPASS/mss-sead-plenitudo-iac && echo -ne "\e]1;Compass-IaC\a"'
alias ~cj='$HOME/Projects/COMPASS/mss-sead-plenitudo-jobs && echo -ne "\e]1;Compass-Jobs\a"'
alias portal='$HOME/turnercode/mss-sead-plenitudo-portal && oo && e. && echo -ne "\e]1;Compass-Portal\a"'

# alias ~ls='$HOME/Projects/LOCKSTEP/mss-sead-lockstep'
# alias ~lsi='$HOMEProjects/LOCKSTEP/mss-sead-lockstep-iac'

alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && e. && echo -ne "\e]1;TurnerCode\a"'

alias metis='$HOME/turnercode/cp-metis && oo && e. && echo -ne "\e]1;metis\a"'
alias common='$HOME/go/src/github.com/turnercode/odt-common-go && oo && e. && echo -ne "\e]1;ODT-Common-GO\a"'
alias compass-go='$HOME/go/src/github.com/turnercode/odt-compass-go && oo && e. && echo -ne "\e]1;ODT-Compass-GO\a"'
alias lockstep='$HOME/go/src/github.com/turnercode/odt-lockstep-go && oo && e. && echo -ne "\e]1;ODT-LockStep-GO\a"'
alias ~qwgo='$HOME/Projects/GO/src/github.com/turnercode/odt-queuewatcher && oo && e. && echo -ne "\e]1;ODT-Queue-Watcher\a"'
alias ~wvgo='$HOME/Projects/GO/src/github.com/turnercode/odt-waverly && oo && e. && echo -ne "\e]1;ODT-Waverly\a"'
alias ~gobot='$HOME/Projects/GO/src/github.com/turnercode/odtbot && oo && e. && echo -ne "\e]1;ODT-GOBOT\a"'

alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && echo -ne "\e]1;TURNERCODE\a"'

alias ~odt='$HOME/Projects/ODT/mss-sead-odt && echo -ne "\e]1;ODT\a"'
alias ~odti='$HOME/Projects/ODT/mss-sead-odt-iac && echo -ne "\e]1;ODT-IaC\a"'

alias update-samlkeygen='pip install --upgrade samlkeygen'

function buildnum() {
  cd ~/Projects/GO/src/github.com/turnercode/buildnumber
  source ./build.sh $1 $2
  cd -
}

function build() {
  source ./build.sh
}

function deploy() {
  source ../scripts/deploy.sh $1 $2
}

function cstoreupgrade() {
  sudo curl -L -o /usr/local/bin/cstore https://github.com/turnerlabs/cstore/releases/download/v4.0.0-alpha/cstore_darwin_amd64 && sudo chmod +x /usr/local/bin/cstore
}

function parse_git_branch_name() {
  export GITBRANCHNAME=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

# Change Directory Compass IaC
# $1 = project ( e.g. api, jobs, portal)
# $2 = environment ( e.g. dev, qa, staging, prod)
function cdci() {
  # cd $HOME/Projects/COMPASS/mss-sead-compass-iac/$1/env/$2
  if [ "$2" = "prod" ]; then
    cd $HOME/Projects/COMPASS/mss-sead-compass-iac-prod/$1/prod
  else
    cd $HOME/Projects/COMPASS/mss-sead-compass-iac/$1/env/$2
  fi
}

# Change Directory OnDemand Tools IaC
# $1 = project ( e.g. api, jobs, portal)
# $2 = environment ( e.g. dev, qa, staging, prod)
function cdoi() {
  # cd $HOME/Projects/ODT/mss-sead-odt-iac/$1/env/$2
  if [ "$2" = "prod" ]; then
    cd $HOME/Projects/ODT/mss-sead-odt-iac-prod/$1/prod
  else
    cd $HOME/Projects/ODT/mss-sead-odt-iac/nonprod/$1/env/$2
  fi
}

# Fargate Compass NONPROD deployers
# $1 = projects ( e.g. api, jobs, portal )
# $2 = environment ( e.g. dev, stating, qa)
# $3 = build number
function deploy_Compass() {
  AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-devops
  # cd $HOME/Projects/COMPASS/mss-sead-compass-iac/$1/env/$2
  # echo 'deploying '$1' image tag '$FG[yellow]$FX[bold]$3$FX[none]' to '$FG[yellow]$FX[bold]$2$FX[none]
  fargate service deploy -c compassdashboard-$1-$2 -s compassdashboard-$1-$2 -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/compassdashboard-$1:$3
  # cd -
}

# Fargate ODT NONPROD deployers
# $1 = projects ( e.g. api, jobs, portal )
# $2 = environment ( e.g. dev, stating, qa)
# $3 = build number
function deploy_ODT() {
  AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-devops
  # cd $HOME/Projects/ODT/mss-sead-odt-iac/$1/env/$2
  fargate service deploy -c ondemandtools-$1-$2 -s ondemandtools-$1-$2 -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/ondemandtools-$1:2.3.1.$3
  # cd -
}

# Start Compass Development Express Server
function ws() {
  clear
  echo $FG[white]"running WebServer: "$FG[cyan]$FX[bold]"\nnodemon ./src/app.js"$FX[none]
  export COMPASS_ENV=local
  nodemon ./src/app.js
}

# Start Compass Webpack-Dev-Server
function ds() {
  clear
  echo $FG[white]"running DevWebServer: "$FG[yellow]$FX[bold]"\nwebpack-dev-server --colors --config config/webpack.config.dev.js\n"$FX[none]
  webpack-dev-server --colors --config config/webpack.config.dev.js
}

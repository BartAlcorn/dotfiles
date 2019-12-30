#
# Turner Specific aliases
# Bart Alcorn
#

# AWS Authentication
alias samld='docker run -it -v $HOME/.aws:/aws turnerlabs/samlkeygen authenticate --url "https://sts.turner.com/adfs/ls/IdpInitiatedSignOn.aspx?loginToRp=urn:amazon:webservices" --domain Turner --username $USER --all-accounts --auto-update'
alias awsprofs='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen list-profiles'
alias awsprof='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen select-profile'

alias tf='terraform'
alias fsi='fargate service info'
alias tfkeys='terraform state show aws_iam_access_key'

alias aws_odt='AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-devops'
alias aws_odt_admin='AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin'
alias aws_prod='AWS_PROFILE=aws-sead-prod:aws-sead-prod-devops'
alias aws_nonprod='AWS_PROFILE=aws-sead-nonprod:aws-sead-nonprod-devops'

alias ~pj='$HOME/Projects'

alias ~ca='$HOME/Projects/COMPASS/mss-sead-compass-api && echo -ne "\e]1;Compass-API\a"'
alias ~ci='$HOME/Projects/COMPASS/mss-sead-compass-iac && echo -ne "\e]1;Compass-IaC\a"'
alias ~cj='$HOME/Projects/COMPASS/mss-sead-compass-jobs && echo -ne "\e]1;Compass-Jobs\a"'
alias ~cp='$HOME/Projects/COMPASS/mss-sead-compass-portal && echo -ne "\e]1;Compass-Portal\a"'

alias ~ls='$HOME/Projects/LOCKSTEP/mss-sead-lockstep'
alias ~lsi='$HOMEProjects/LOCKSTEP/mss-sead-lockstep-iac'

alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && e. && echo -ne "\e]1;TurnerCode\a"'

alias ~cmgo='$HOME/Projects/GO/src/github.com/turnercode/odt-common-go && oo && e. && echo -ne "\e]1;ODT-Common-GO\a"'
alias ~cpgo='$HOME/Projects/GO/src/github.com/turnercode/odt-compass-go && oo && e. && echo -ne "\e]1;ODT-Compass-GO\a"'
alias ~lsgo='$HOME/Projects/GO/src/github.com/turnercode/odt-lockstep-go && oo && e. && echo -ne "\e]1;ODT-LockStep-GO\a"'
alias ~qwgo='$HOME/Projects/GO/src/github.com/turnercode/odt-queuewatcher && oo && e. && echo -ne "\e]1;ODT-Queue-Watcher\a"'
alias ~wvgo='$HOME/Projects/GO/src/github.com/turnercode/odt-waverly && oo && e. && echo -ne "\e]1;ODT-Waverly\a"'
alias ~gobot='$HOME/Projects/GO/src/github.com/turnercode/odtbot && oo && e. && echo -ne "\e]1;ODT-GOBOT\a"'

alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && echo -ne "\e]1;TURNERCODE\a"'

alias ~odt='$HOME/Projects/ODT/mss-sead-odt && echo -ne "\e]1;ODT\a"'
alias ~odti='$HOME/Projects/ODT/mss-sead-odt-iac && echo -ne "\e]1;ODT-IaC\a"'

alias update-samlkeygen='pip install --upgrade samlkeygen'
alias awsrepologin='aws ecr get-login --no-include-email'

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
  sudo curl -L -o /usr/local/bin/cstore https://github.com/turnerlabs/cstore/releases/download/v3.6.0-alpha/cstore_darwin_amd64 && sudo chmod +x /usr/local/bin/cstore
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
  AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin
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
  AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin
  # cd $HOME/Projects/ODT/mss-sead-odt-iac/$1/env/$2
  fargate service deploy -c ondemandtools-$1-$2 -s ondemandtools-$1-$2 -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/ondemandtools-$1:2.3.1.$3
  # cd -
}

# David's bulk deploy ODT function
function deployODT() {
  # $1 - env
  # $2 - build number

  osascript <<EOF
tell application "iTerm"
    tell current session of current window
        -- set size
        set columns to 300
        set rows to 54
        write text "clear"
        write text "cd $HOME/Documents/GitHub/mss-sead-odt-iac/portal/env/\"$1\""
        write text "fargate service deploy -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/ondemandtools-portal:2.3.1.\"$2\""
        write text "fsi"
    end tell
    tell current window
        create tab with profile "Default"
        tell current session of current tab
            write text "clear"
            write text "cd $HOME/Documents/GitHub/mss-sead-odt-iac/jobs/env/\"$1\""
            write text "fargate service deploy -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/ondemandtools-jobs:2.3.1.\"$2\""
            write text "fsi"
        end tell
        select tab index 1
    end tell
    tell current window
        create tab with profile "Default"
        tell current session of current tab
            write text "clear"
            write text "cd $HOME/Documents/GitHub/mss-sead-odt-iac/api/env/\"$1\""
            write text "fargate service deploy -i 837769064668.dkr.ecr.us-east-1.amazonaws.com/ondemandtools-api:2.3.1.\"$2\""
            write text "fsi"
        end tell
        select tab index 1
    end tell
end tell
EOF
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

#
# Turner Specific aliases
# Bart Alcorn
#

alias tf='terraform'
alias fsi='fargate service info'
alias tfkeys='terraform state show aws_iam_access_key'

alias ~pj='$HOME/Projects'

alias ~ca='$HOME/Projects/COMPASS/mss-sead-compass-api && echo -ne "\e]1;Compass-API\a"'
alias ~ci='$HOME/Projects/COMPASS/mss-sead-compass-iac && echo -ne "\e]1;Compass-IaC\a"'
alias ~cj='$HOME/Projects/COMPASS/mss-sead-compass-jobs && echo -ne "\e]1;Compass-Jobs\a"'
alias ~cp='$HOME/Projects/COMPASS/mss-sead-compass-portal && echo -ne "\e]1;Compass-Portal\a"'

alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && e. && echo -ne "\e]1;TurnerCode\a"'

alias ~arcys='$HOME/Projects/GO/src/github.com/turnercode/arcys && oo && e. && echo -ne "\e]1;arcys\a"'
alias ~zephyr='$HOME/Projects/GO/src/github.com/turnercode/zephyr && oo && e. && echo -ne "\e]1;zephyr\a"'
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

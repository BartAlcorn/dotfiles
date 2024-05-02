#
# Turner Specific aliases
# Bart Alcorn
#

alias tf='terraform'
alias fsi='fargate service info'
alias tfkeys='terraform state show aws_iam_access_key'

alias ~pj='$HOME/Projects'

# Compass ECS
alias ~ca='$HOME/Projects/COMPASS/mss-sead-compass-api && echo -ne "\e]1;Compass-API\a"'
alias ~ci='$HOME/Projects/COMPASS/mss-sead-compass-iac && echo -ne "\e]1;Compass-IaC\a"'
alias ~cj='$HOME/Projects/COMPASS/mss-sead-compass-jobs && echo -ne "\e]1;Compass-Jobs\a"'
alias ~cp='$HOME/Projects/COMPASS/mss-sead-compass-portal && echo -ne "\e]1;Compass-Portal\a"'

# GO
alias ~aci='$HOME/Projects/GO/src/github.com/turnercode/cp-awfm-iac && oo && e. && echo -ne "\e]1;CP-AWFM-IAC\a"'
alias ~acm='$HOME/Projects/GO/src/github.com/turnercode/cp-awfm-common && oo && e. && echo -ne "\e]1;CP-AWFM-Common\a"'
alias ~awfm='$HOME/Projects/GO/src/github.com/turnercode/awfm && oo && e. && echo -ne "\e]1;AWFM\a"'
alias ~cmgo='$HOME/Projects/GO/src/github.com/turnercode/odt-common-go && oo && e. && echo -ne "\e]1;ODT-Common-GO\a"'
alias ~cp2go='$HOME/Projects/GO/src/github.com/turnercode/cp-compass && oo && e. && echo -ne "\e]1;CP-Compass\a"'
alias ~cpgo='$HOME/Projects/GO/src/github.com/turnercode/odt-compass-go && oo && e. && echo -ne "\e]1;ODT-Compass-GO\a"'
alias ~gobot='$HOME/Projects/GO/src/github.com/turnercode/odtbot && oo && e. && echo -ne "\e]1;ODT-GOBOT\a"'
alias ~lsgo='$HOME/Projects/GO/src/github.com/turnercode/odt-lockstep-go && oo && e. && echo -ne "\e]1;ODT-LockStep-GO\a"'
alias ~nt='$HOME/Projects/GO/src/github.com/bartalcorn/nautilus && oo && e. && echo -ne "\e]1;Nautilus\a"'
alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && echo -ne "\e]1;TURNERCODE\a"'
alias ~uc='$HOME/Projects/GO/src/gitlab.com && oo && e. && echo -ne "\e]1;Unchained\a" && la'
alias ~ucc='$HOME/Projects/GO/src/github.com/turnercode/unchained-common && oo && e. && echo -ne "\e]1;Unchained Common\a" && la'
alias ~wbd='$HOME//Projects/GO/src/github.com/wbd-streaming && echo -ne "\e]1;WBD Streaming\a" && la'
alias ~wvgo='$HOME/Projects/GO/src/github.com/turnercode/odt-waverly && oo && e. && echo -ne "\e]1;ODT-Waverly\a"'
alias ~zephyr='$HOME/Projects/GO/src/github.com/turnercode/zephyr && oo && e. && echo -ne "\e]1;zephyr\a" && la'

alias update-samlkeygen='pip install --upgrade samlkeygen'
alias jON='sudo jamf manage'
alias jOFF='sudo jamf removeMDMProfile'

function parse_git_branch_name() {
  export GITBRANCHNAME=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

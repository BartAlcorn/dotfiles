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
alias ~acm='$HOME/Projects/GO/src/github.com/turnercode/cp-awfm-common && oo && e. && echo -ne "\e]1;CP-AWFM-Common\a"'
alias ~aci='$HOME/Projects/GO/src/github.com/turnercode/cp-awfm-iac && oo && e. && echo -ne "\e]1;CP-AWFM-IAC\a"'
alias ~awfm='$HOME/Projects/GO/src/github.com/turnercode/awfm && oo && e. && echo -ne "\e]1;AWFM\a"'
alias ~cmgo='$HOME/Projects/GO/src/github.com/turnercode/odt-common-go && oo && e. && echo -ne "\e]1;ODT-Common-GO\a"'
alias ~cp2go='$HOME/Projects/GO/src/github.com/turnercode/cp-compass && oo && e. && echo -ne "\e]1;CP-Compass\a"'
alias ~cpgo='$HOME/Projects/GO/src/github.com/turnercode/odt-compass-go && oo && e. && echo -ne "\e]1;ODT-Compass-GO\a"'
alias ~gobot='$HOME/Projects/GO/src/github.com/turnercode/odtbot && oo && e. && echo -ne "\e]1;ODT-GOBOT\a"'
alias ~lsgo='$HOME/Projects/GO/src/github.com/turnercode/odt-lockstep-go && oo && e. && echo -ne "\e]1;ODT-LockStep-GO\a"'
alias ~nt='$HOME/Projects/GO/src/github.com/bartalcorn/nautilus && oo && e. && echo -ne "\e]1;Nautilus\a"'
alias ~tc='$HOME/Projects/GO/src/github.com/turnercode/ && oo && echo -ne "\e]1;TURNERCODE\a"'
alias ~wvgo='$HOME/Projects/GO/src/github.com/turnercode/odt-waverly && oo && e. && echo -ne "\e]1;ODT-Waverly\a"'
alias ~uc='$HOME/Projects/GO/src/gitlab.com && oo && e. && echo -ne "\e]1;Unchained\a" && la'
alias ~ucc='$HOME/Projects/GO/src/github.com/turnercode/unchained-common && oo && e. && echo -ne "\e]1;Unchained Common\a" && la'
alias ~zephyr='$HOME/Projects/GO/src/github.com/turnercode/zephyr && oo && e. && echo -ne "\e]1;zephyr\a" && la'

# ODT ECS
alias ~odt='$HOME/Projects/ODT/mss-sead-odt && echo -ne "\e]1;ODT\a"'
alias ~odti='$HOME/Projects/ODT/mss-sead-odt-iac && echo -ne "\e]1;ODT-IaC\a"'

alias update-samlkeygen='pip install --upgrade samlkeygen'

alias jON='sudo jamf manage'
alias jOFF='sudo jamf removeMDMProfile'

function buildnum() {
  cd ~/Projects/GO/src/github.com/turnercode/buildnumber
  source ./build.sh $1 $2
  cd -
}

function build() {
  for trg in api cron invoke sqs; do
    if [ -d "./handler/$trg" ]; then
      echo "Building $trg"
      cd ./handler/$trg
      gmake push
      cd ../..
    fi
  done
}

function deploy() {
  for trg in api cron invoke sqs; do
    if [ -d "./handler/$trg" ]; then
      echo "Building $trg"
      cd ./handler/$trg
      gmake deploy STAGE=$1 TRIGGERS=$trg
      cd ../..
    fi
  done
}

function cstoreupgrade() {
  sudo curl -L -o /usr/local/bin/cstore https://github.com/turnerlabs/cstore/releases/download/v4.0.0-alpha/cstore_darwin_amd64 && sudo chmod +x /usr/local/bin/cstore
}

function parse_git_branch_name() {
  export GITBRANCHNAME=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
}

function stasher() {
  if [ $# -eq 0 ]; then
    echo "No arguments provided, you MUST provide the package name!"
    return
  fi

  autoload -U zmv

  PKG=$1
  STAGE=${PWD##*/}
  SRC="../../configs/${STAGE}/${PKG}.env"

  echo "stash sync $SRC -c zephyr -s secrets-manager -t $STAGE"
  stash sync $SRC -c zephyr -s secrets-manager -t $STAGE

  zmv 'stash.yml' '${PKG}.yml'
}

function terraforma() {
  echo "Converting this lambda folder to use Terraform."

  if [ $# -eq 0 ]; then
    echo "No arguments provided, you MUST provide the app name!"
    return
  fi

  APP=$1

  cp -f ../iac/templates/Makefile Makefile
  sed -i '' "s/APP/${APP}/g" Makefile

  SetUpStage() {
    cp -f ../../../iac/templates/terraform.tfvars terraform.tfvars
    sed -i '' "s/STAGE/${STAGE}/g" terraform.tfvars

    cp -f ../../../iac/templates/terraformer.tf terraformer.tf
    sed -i '' "s/APP/${APP}/g" terraformer.tf
    sed -i '' "s/STAGE/${STAGE}/g" terraformer.tf

    ln -s ../main.tf main.tf
    ln -s ../variables.tf variables.tf
  }

  mkdir -p "iac/dev"
  mkdir -p "iac/qa"
  mkdir -p "iac/uat"
  mkdir -p "iac/prod"

  cd iac
  cp -f ../../iac/templates/main.tf main.tf
  cp -f ../../iac/templates/variables.tf variables.tf
  sed -i '' "s/APP/${APP}/g" variables.tf

  cd dev
  STAGE='dev'
  SetUpStage
  cd ../qa
  STAGE='qa'
  SetUpStage
  cd ../uat
  STAGE='uat'
  SetUpStage
  cd ../prod
  STAGE='prod'
  SetUpStage

  cd ../..

}

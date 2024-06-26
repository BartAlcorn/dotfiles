#
# AWS Specific aliases
# Bart Alcorn
#

export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=aws-msc-ops-nonprod:aws-msc-ops-nonprod-developer-disco
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1
# export ADFS_DOMAIN="Turner"
# export ADFS_URL="https://sts.turner.com/adfs/ls/IdpInitiatedSignOn.aspx?loginToRp=urn:amazon:webservices"
# export AWS_PROFILE=$(docker run -v ~/.aws:/aws turnerlabs/samlkeygen select-profile $AWS_PROFILE)

# AWS Authentication
# alias samld='docker run --rm -it -v $HOME/.aws:/aws turnerlabs/samlkeygen authenticate --url "https://sts.turner.com/adfs/ls/IdpInitiatedSignOn.aspx?loginToRp=urn:amazon:webservices" --domain Turner --username $USER --all-accounts'
# alias awsprofs='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen list-profiles'
# alias awsprof='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen select-profile'

alias npmlogin='awspf && gimme-aws-creds --roles arn:aws:iam::530694037299:role/aws-msc-poc-nonprod-admin && awsca'
alias awsca='echo "Retrieving CodeArtifact Auth" | lolcat && aws codeartifact login --tool npm --repository msc-repo --domain ps-prod --domain-owner 986501092299 --region us-east-1'

# run AWS DynamoDB locally, for testing
alias dynamo-local='docker run -p 8000:8000 amazon/dynamodb-local'
alias awsrepologin='aws ecr get-login --no-include-email'

alias gimme-aws-creds="docker run -it --rm -v ~/.aws/credentials:/root/.aws/credentials -v ~/.okta_aws_login_config:/root/.okta_aws_login_config gimme-aws-creds"

function awsp() {
  echo "AWS_PROFILE: $AWS_PROFILE" | lolcat
  echo "AWS_ACCOUNT: $AWS_ACCOUNT" | lolcat
}

function awspf() {
  f="$HOME/dotfiles/configs/awsaccounts.json"
  accnt="$(jq -r '.aws[] | .role' $f | fzf --cycle --reverse | xargs)"
  awsprofile $accnt
}

function awsprofile() {
  f="$HOME/dotfiles/configs/awsaccounts.json"
  p="$(jq -r '.aws[] | select(.role=="'$1'") | .profile' $f)"
  r="$(jq -r '.aws[] | select(.role=="'$1'") | .role' $f)"
  a="$(jq -r '.aws[] | select(.role=="'$1'") | .account' $f)"
  export AWS_PROFILE=$p:$r
  export AWS_ACCOUNT=$a
  awsp
}

# region (no parameter == us-east-1, empty string unsets, otherwise set to new region)
region() {
  if (($# == 0)); then
    set -- us-east-1
  fi
  if [[ -z $1 ]]; then
    unset AWS_DEFAULT_REGION
  else
    export AWS_DEFAULT_REGION=$1
  fi
}

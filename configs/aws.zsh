#
# AWS Specific aliases
# Bart Alcorn
#

export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin
export AWS_REGION=us-east-1
export AWS_DEFAULT_REGION=us-east-1
export ADFS_DOMAIN="Turner"
export ADFS_URL="https://sts.turner.com/adfs/ls/IdpInitiatedSignOn.aspx?loginToRp=urn:amazon:webservices"
# export AWS_PROFILE=$(docker run -v ~/.aws:/aws turnerlabs/samlkeygen select-profile $AWS_PROFILE)

# AWS Authentication
alias samld='docker run --rm -it -v $HOME/.aws:/aws turnerlabs/samlkeygen authenticate --url "https://sts.turner.com/adfs/ls/IdpInitiatedSignOn.aspx?loginToRp=urn:amazon:webservices" --domain Turner --username $USER --all-accounts'
alias awsprofs='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen list-profiles'
alias awsprof='docker run --rm -v $HOME/.aws:/aws turnerlabs/samlkeygen select-profile'

# run AWS DynamoDB locally, for testing
alias dynamo-local='docker run -p 8000:8000 amazon/dynamodb-local'
alias awsrepologin='aws ecr get-login --no-include-email'

alias awsp_cp='AWS_PROFILE=aws-contentplatforms-prod:aws-contentplatforms-prod-devops'
alias awsp_cmp='AWS_PROFILE=aws-cp-compass-prod:aws-cp-compass-prod-admin'
alias awsp_odt='AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin'

alias gimme-creds="docker run -it --rm -v ~/.aws/credentials:/root/.aws/credentials -v ~/.okta_aws_login_config:/root/.okta_aws_login_config gimme-aws-creds:latest"

function awsprofile() {
  if [ "$1" = "cmp" ]; then
    export AWS_PROFILE=aws-cp-compass-prod:aws-cp-compass-prod-admin
    echo "AWS_PROFILE=aws-cp-compass-prod:aws-cp-compass-prod-admin"
  elif [ "$1" = "cp" ]; then
    export AWS_PROFILE=aws-contentplatforms-prod:aws-contentplatforms-prod-devops
    echo "AWS_PROFILE=contentplatforms-prod:aws-contentplatforms-prod-devops"
  else
    export AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin
    echo "AWS_PROFILE=aws-sead-ondemandtools:aws-sead-ondemandtools-admin"
  fi
}

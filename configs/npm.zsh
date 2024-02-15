alias ni='npm install'
alias nd='npm run dev'
alias nr='npm run'
alias nb='npm run build'
alias nst='npm run start'
alias nsv='npm run serve'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

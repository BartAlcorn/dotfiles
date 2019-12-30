#!/usr/local/bin/zsh

cd $HOME

mkdir Projects && cd Projects
mkdir COMPASS
mkdir LOCKSTEP
mkdir ODT
mkdir TURNER

cd COMPASS
git clone git@github.com:turnercode/mss-sead-plenitudo-api.git mss-sead-compass-api
git clone git@github.com:turnercode/mss-sead-plenitudo-iac.git mss-sead-compass-iac
git clone git@github.com:turnercode/mss-sead-plenitudo-jobs.git mss-sead-compass-jobs
git clone git@github.com:turnercode/mss-sead-plenitudo-portal.git mss-sead-compass-portal

cd ../LOCKSTEP
git clone git@github.com:turnercode/mss-sead-lockstep.git
git clone git@github.com:turnercode/mss-sead-lockstep-iac.git

cd ../ODT
git clone git@github.com:turnercode/mss-sead-odt.git
git clone git@github.com:turnercode/mss-sead-odt-iac.git

cd ../TURNER
git clone git@github.com:turnercode/sead-terraform-constants.git

cd $HOME

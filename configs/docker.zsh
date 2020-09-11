#
# Docker Specific aliases
# Bart Alcorn
#

alias dockerRmAllContainers="docker rm $(docker ps -aq)"

# alias dockerlogin=$(aws ecr get-login --no-include-email | awk '{print $6}' | docker login -u AWS --password-stdin "$endpoint")

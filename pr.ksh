#!/usr/bin/ksh -x

owner=ennisa-ire
owner=iot-ire-tech
repo=mytasks

curl --insecure --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo
#curl --user ennisa-ire:FionnAnto1972 -X https://api.github.com/repos/ennisa-ire/tasks/hooks 



DATA='{"title": "Amazing new feature", "body": "Please pull this in!", "head": "iot-ire-tech:master", "base": "master"}'
DATA='{"title": "Amazing new feature", "body": "Please pull this in!", "head": "ennisa-ire:master", "base": "master"}'
curl --insecure --user ennisa-ire:FionnAnto1972 -X POST --data "$DATA" https://api.github.com/repos/$owner/$repo/pulls
curl --insecure --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo/pulls?state=all
exit

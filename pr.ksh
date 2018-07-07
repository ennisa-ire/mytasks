#!/usr/bin/ksh -x

#https://github.com/mikeparker/prcreator-testing.git
owner=iot-ire-tech
owner=mikeparker
repo=prcreator-testing

owner=ennisa-ire
repo=mytasks

#curl --insecure --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo
#curl --insecure  -X GET https://api.github.com/repos/$owner/$repo
#curl --user ennisa-ire:FionnAnto1972 -X https://api.github.com/repos/ennisa-ire/tasks/hooks 



DATA='{"title": "Amazing new feature", "body": "Please pull this in!", "head": "ennisa-ire:master", "base": "master"}'
DATA='{"title": "This Amazing new feature", "body": "Please pull this in!", "head": "mikeparker:next", "base": "mikeparker:master"}'
#https://github.com/mikeparker/prcreator-testing/pull/create?base=mikeparker:master&head=mikeparker:next
curl --insecure -X POST --data "$DATA" https://api.github.com/repos/$owner/$repo/pulls
curl --insecure -X GET https://api.github.com/repos/$owner/$repo/pulls?state=all
exit


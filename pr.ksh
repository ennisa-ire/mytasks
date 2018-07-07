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


# https://github.com/ennisa-ire/mytasks/pull/create?base=ennisa-ire:master&head=ennisa-ire:pull-request-demo
#https://github.com/mikeparker/prcreator-testing/pull/create?base=mikeparker:master&head=mikeparker:next

DATA='{"title": "This Amazing new feature", "body": "Please pull this in!", "head": "mikeparker:next", "base": "mikeparker:master"}'
DATA='{"title": "Amazing new feature", "body": "Please pull this in!", "head": "ennisa-ire:pull-request-demo", "base": "ennisa-ire:master"}'

# Create A PR across branchs
DATA='{"title": "Amazing new feature", "body": "Please pull this in!", "head": "pull-request-demo", "base": "master"}'
curl --insecure --user ennisa-ire:FionnAnto1972 -X POST --data "$DATA" https://api.github.com/repos/$owner/$repo/pulls
exit

# Query Is PR Merged Already
# NO: Response 404
curl --insecure -w "\n%{http_code}\n" --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo/pulls/2/merge

# Send Parameterized Job To Dev Pipelien
# Input Forked Repo.


# Merge PR
# "message": "Pull Request successfully merged"
curl --insecure -w "\n%{http_code}\n" --user ennisa-ire:FionnAnto1972 -X PUT https://api.github.com/repos/$owner/$repo/pulls/2/merge

# Query Is PR Merged Already
# YES: Response 204
curl --insecure -w "\n%{http_code}\n" --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo/pulls/2/merge

exit
curl --insecure --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo/pulls?state=closed
curl --insecure --user ennisa-ire:FionnAnto1972 -X GET https://api.github.com/repos/$owner/$repo/pulls?state=open
exit


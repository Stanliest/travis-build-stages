#!/bin/sh

echo "${TRAVIS_PULL_REQUEST}"

body='{
  "request": {
    "branch":"mastercopy",
    "message": "Trigger sanity test",
    "merge_mode": "replace",
    "config": {
      "script": [
        "./test.sh"
      ],
      "after_success": [
        "curl -s -X POST -H \"Accept: application/vnd.github.v3+json\" -H \"Authorization: token '${token_token_token}'\" -d \"{'"commit_title"':'"Merging from develop to master"'}\" https://api.github.com/repos/Stanliest/travis-build-stages/pulls/'${TRAVIS_PULL_REQUEST}'/merge"
      ]
    }
  }
}'

curl -s -X POST \
  -H "Accept: application/json" \
  -H "Authorization: token ${travis_token}" \
  -H "Content-Type: application/json" \
  -H "Travis-API-Version: 3" \
  -d "$body" \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/requests
 
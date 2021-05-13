#!/bin/sh

echo "${TRAVIS_PULL_REQUEST}"


body='{
  "request": {
    "branch":"mastercopy",
    "message": "Trigger sanity test",
    "merge_mode": "replace",
    "config": {
      "jobs": {},
      "script": [
        "./test.sh"
      ],
      "after_success": [
        "curl -X PUT -H \"Accept: application/vnd.github.v3+json\" -H \"Authorization: token '${token_token_token}'\" httpss://api.github.com/repos/Stanliest/travis-build-stages/pulls/'${TRAVIS_PULL_REQUEST}'/merge"
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
 
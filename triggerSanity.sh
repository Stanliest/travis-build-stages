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
        "echo \"hello\""
        "echo \"hello\""
        "echo \"hello\""
        "echo \"hello\""
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
 
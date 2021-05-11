#!/bin/sh

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
        "curl -s -X POST \
          -H 'Accept: application/json' \
          -H 'Authorization: token $token_token_token' \
          -H 'Content-Type: application/json' \
          -H 'Travis-API-Version: 3' \
          https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/pulls/'${TRAVIS_PULL_REQUEST}'/merge"
      ]
    }
  }
}'

curl -s -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $token_token_token" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  -d "$body" \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/requests
 
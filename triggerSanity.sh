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
        "./merge-PR.sh"
      ]
    }
  }
}'

curl -s -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $token_for_API" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  -d "$body" \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/requests
  
#!/bin/sh

body='{
  "request": {
    "branch":"develop",
    "message": "This build is triggered by Travis API",
    "merge_mode": "replace",
    "config": {
      "jobs": {
        "include": [
          {
            "stage": "Test triggered by API only",
            "script": [
              "echo \"test should only be triggered by API\""
            ],
            "env": [
              {
                "TestAPI": ""
              }
            ]
          }
        ]
      },
      "stages": [
        {
          "name": "Test triggered by API only",
          "if": "branch = develop"
        }
      ]
    }
  }
}'

curl -s -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $TRAVIS_API_TOKEN" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  -d "$body" \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/requests
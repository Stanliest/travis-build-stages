#!/bin/sh

body='{"request": {"branch":"develop"}}'

curl -s -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $TRAVIS_API_TOKEN" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  -d "$body" \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/requests
#!/bin/sh

body='{
  "request": {
  "branch":"develop"
  }
}'

curl -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $TRAVIS_API_TOKEN" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  -d '{"request": {"branch":"develop"}}' \
  https://api.travis-ci.com/Stanliest/travis-build-stages/requests
#!/bin/sh

echo "PR number: ${TRAVIS_PULL_REQUEST}"
echo "Repo name: ${TRAVIS_REPO_SLUG#*/}"
echo "Repo name: ${REPO_NAME}"

curl -s -X POST \
  -H 'Accept: application/json' \
  -H "Authorization: token $token_token_token" \
  -H 'Content-Type: application/json' \
  -H 'Travis-API-Version: 3' \
  https://api.travis-ci.com/repo/Stanliest%2Ftravis-build-stages/pulls/${TRAVIS_PULL_REQUEST}/merge
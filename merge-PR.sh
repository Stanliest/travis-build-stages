#!/bin/sh

echo "PR number: ${TRAVIS_PULL_REQUEST}"
echo "Repo name: ${TRAVIS_REPO_SLUG#*/}"
echo "Repo name: ${REPO_NAME}"

curl -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${token_token_token}" \
  https://api.github.com/repos/Stanliest/travis-build-stages/pulls/${TRAVIS_PULL_REQUEST}/merge
#!/usr/bin/env bash

set -eu

ENTRYPOINT="${ENTRYPOINT?ENTRYPOINT missing}"
GITHUB_USERNAME="${GITHUB_USERNAME?GITHUB_USERNAME missing}"

TARGET_DIR="${HOME}/target"
mkdir "${TARGET_DIR}"

GIT_CREDS_PATH="$(pwd)/github_token"
export GIT_CREDS_PATH

git config --global credential.helper "store --file ${GIT_CREDS_PATH}"
echo "https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com" > "${GIT_CREDS_PATH}"

for r in $(gh api "${ENTRYPOINT}/repos" | jq -c -r '.[] | { url: .clone_url, name: .name }' ); do
    url=$(echo "$r" | jq -c -r '.url')
    name=$(echo "$r" | jq -c -r '.name')
    echo "Processing ${name} with repo url ${url}"

    cd "${TARGET_DIR}"
    if [ -d "${name}" ]; then
        cd "${name}" && git pull
    else
        git clone "$url"
    fi
done
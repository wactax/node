#!/usr/bin/env bash

_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull
./build.sh
cd $_DIR/pkg
version=$(cat package.json | jq -r '.version')
npm version patch
git add -u
git commit -m $version
git push
npm publish --access=public

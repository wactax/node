#!/usr/bin/env bash
set -ex
_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull
bunx mdt .
./build.sh
cd $_DIR/pkg
version=$(cat package.json | jq -r '.version')
npm version patch
git add -u
git commit -m $version
git push
npm publish --access=public

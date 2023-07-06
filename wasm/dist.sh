#!/usr/bin/env bash

_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull

./build.sh
sed -i '/function initSync(module)/,$d' pkg/_.js
cat ./_patch.js >>pkg/_.js

cd $_DIR/pkg
version=$(cat package.json | jq -r '.version')
npm version patch
git add -u
git commit -m $version
git push
npm publish --access=public

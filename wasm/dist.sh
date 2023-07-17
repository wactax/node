#!/usr/bin/env bash

_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull

cd $_DIR/pkg
jq '.name="@w5/wasm"' pkg/package.json | sponge pkg/package.json
version=$(cat package.json | jq -r '.version')
npm version patch

cd $_DIR
./build.sh
git add -u
git commit -m "$version"
npm publish --access=public

cd $_DIR/pkg
jq '.name="@w5/wasm-vite"' pkg/package.json | sponge pkg/package.json
sed -i '/function initSync(module)/,$d' pkg/_.js
sed -i '/__wbg_init\./d' pkg/_.js
cat ./_patch.js >>pkg/_.js
./patch.coffee

git add -u
git commit -m "$version vite"
git push
npm publish --access=public

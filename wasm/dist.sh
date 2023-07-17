#!/usr/bin/env bash
set -ex
_DIR=$(
  cd "$(dirname "$0")"
  pwd
)
git add -A
git pull

cd $_DIR/pkg
jq '.name="@w5/wasm"' package.json | sponge package.json
version=$(cat package.json | jq -r '.version')
npm version patch

cd $_DIR
./build.sh
git add -u
git commit -m "$version"
npm publish --access=public

cd $_DIR/pkg
jq '.name="@w5/vite"' package.json | sponge package.json
sed -i '/function initSync(module)/,$d' _.js
sed -i '/__wbg_init\./d' _.js
cat ../_patch.js >>_.js
../patch.coffee

git add -u
git commit -m "$version vite"
git push
npm publish --access=public

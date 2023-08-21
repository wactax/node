#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

build
cp lib/PG_ENV.js lib/APG_ENV.js
cp lib/PG.js lib/APG.js
sed -i 's/PG/APG/g' lib/APG_ENV.js lib/APG.js

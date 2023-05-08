#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

./build.sh

if [ ! -n "$1" ]; then
  ./test.sh
  glow -s dracula out.txt
else
  exec ./${@:1}
fi

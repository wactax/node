#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR

xpendclaim=$(cat xpendclaim.lua | jq -Rs '.')

echo "export default $xpendclaim" >src/lua.coffee
exec dev $@

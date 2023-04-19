#!/usr/bin/env coffee

> @w5/read
  path > join dirname

{pathname} = new URL(import.meta.url)

dir = dirname dirname pathname

console.log await read join(dir,'dev.sh')

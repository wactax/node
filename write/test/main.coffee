#!/usr/bin/env coffee

> @w5/write
  path > join dirname

{pathname} = new URL(import.meta.url)

dir = dirname pathname

write join(dir,'1/2/3.log'), 'test'

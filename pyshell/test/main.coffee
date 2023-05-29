#!/usr/bin/env coffee

> @w5/pyshell
  @w5/uridir
  path > dirname join

ROOT = dirname uridir(import.meta)

py = pyshell join(ROOT,'test.py')

console.log await py 123

process.exit()

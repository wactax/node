#!/usr/bin/env coffee

> @w5/py
  @w5/uridir
  path > join dirname

ROOT = dirname uridir import.meta

{now} = await py join ROOT, 'test.py'

console.log now

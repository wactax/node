#!/usr/bin/env coffee

> @w5/yml/Yml.js

cwd = process.cwd()
console.log cwd
yml = Yml(cwd)
yml.a = 1
console.log yml.a

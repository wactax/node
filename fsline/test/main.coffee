#!/usr/bin/env coffee

import fsline from '../src/index'

do =>
  n = 0
  for await line from fsline(`import.meta.url.slice(7)`)
    console.log ++n, line

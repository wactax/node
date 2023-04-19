#!/usr/bin/env coffee

import iter2file from '@w5/iter2file'

iter2file(
  'out.txt'
  ->
    n = 0
    while ++n < 5
      yield n+'\n'
)

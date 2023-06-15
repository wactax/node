#!/usr/bin/env coffee

import * as CID from '@w5/cid'

for [k,v] from Object.entries CID
  console.log k,v

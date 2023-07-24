#!/usr/bin/env coffee

import pair from '@w5/pair'
import group from '@w5/pair/group.js'

console.log pair '1|2|3|4|5|6'.split('|')
console.log group 4,'1|2|3|4|5|6|7|8'.split('|')

#!/usr/bin/env coffee

import md2htm from '@w5/md2htm'

console.log await md2htm '''# hi
[a](./&>)
'''

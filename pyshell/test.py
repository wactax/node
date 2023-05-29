#!/usr/bin/env python

import fileinput

for fp in fileinput.input():
  print('<%s' % fp)

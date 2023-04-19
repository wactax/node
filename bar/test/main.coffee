#!/usr/bin/env coffee

> @w5/bar
  @w5/sleep

n = 30

BAR = bar n

while --n
  BAR()
  BAR.log '>', n, new Date
  await sleep 500


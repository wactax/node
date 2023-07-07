#!/usr/bin/env coffee

import {Hour,Minute,Day,Second} from '@w5/time'

> @w5/time/ymMs

console.log Day()
console.log Hour(),Minute(),Second()

[begin_ms, end_ms] = ymMs 2023, 7
begin_date = new Date begin_ms
end_date = new Date end_ms
console.log "#{begin_date.toISOString()}"
console.log "#{end_date.toISOString()}"

process.exit()



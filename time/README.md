[‼️]: ✏️README.mdt

# @w5/time

[test/main.coffee](./test/main.coffee) :

```coffee
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
```

output :

```
19584
470022 28201376 1692082573
2023-07-01T00:00:00.000Z
2023-07-31T23:59:59.999Z
```

#!/usr/bin/env coffee

> @w5/pg/PG > LI0 Q

# Q.close =>
#   console.log '1123'

console.log await LI0"select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')"
console.log "!!<"
process.exit()

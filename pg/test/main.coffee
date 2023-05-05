#!/usr/bin/env coffee

> @w5/pg/PG > LI0 Q

console.log await LI0"select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')"

#!/usr/bin/env coffee

> @w5/pg/PG > EXE Q
  @w5/sleep

< (table)=>
  table = Q table
  (id, val)=>
    EXE"INSERT INTO mq_fail.#{table} (id,val) VALUES (#{id},#{val}) ON CONFLICT (id) DO UPDATE SET val=EXCLUDED.val"

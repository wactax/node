#!/usr/bin/env coffee

> @w5/pg/APG.js > EXE Q

< (table)=>
  table = Q table
  (id, val)=>
    EXE"INSERT INTO mq_fail.#{table} (id,val) VALUES (#{id},#{val}) ON CONFLICT (id) DO UPDATE SET val=EXCLUDED.val"

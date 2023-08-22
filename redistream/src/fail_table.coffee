#!/usr/bin/env coffee

> @w5/pg/APG.js > EXE Q

{PostgresError} = Q

< default main = (table)=>
  table = Q table
  loop
    try
      return await EXE"""CREATE TABLE IF NOT EXISTS mq_fail.#{table} (
id u64 NOT NULL,
val bytea NOT NULL,
ctime u64 NOT NULL DEFAULT floor((date_part('epoch'::text, now()))),
PRIMARY KEY (id)
);"""
    catch err
      if err instanceof PostgresError
        if '3F000' == err.code
          await EXE"CREATE SCHEMA mq_fail"
          continue
      throw err
  return

# await main 'civitaiImg'
# process.exit()

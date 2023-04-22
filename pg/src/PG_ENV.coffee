#!/usr/bin/env coffee

> os > homedir
  path > join
  fs > existsSync
  @w5/write
  ./conn

{env} = process
{PG_URI} = env

export default [
  PG_URI
  +env.PG_POOL_CONN or 16
]

{username, hostname, port, pathname:db} = new URL 'http://'+PG_URI

UINT_FP = join(
  homedir()
  ".cache/pg/uint/#{hostname}/#{port}/#{username}/#{db[1..]}.mjs"
)

if existsSync UINT_FP
  {default:UINT} = await import(UINT_FP)
else
  Q = await conn(PG_URI)
  UINT = await Q"select oid,typname from pg_type where typname in ('u64','u32','u16','u8','i8')".values()
  write(
    UINT_FP
    'export default '+JSON.stringify UINT
  )

export UINT = [
  [20,"bigint"]
  ...UINT
]
#if not existsSync()

# for [oid,name] from await Q"select oid,typname from pg_type where typname in ('u64','u32','u16','u8','i8')".values()

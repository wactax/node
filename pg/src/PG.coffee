#!/usr/bin/env coffee

> ./conn.js
  ./genfunc.js
  ./types.js
  ./PG_ENV.js:ENV > UINT

[
  URI
  POOL_CONN
] = ENV

< Q = conn(
  URI
  {
    types: types(UINT)
    max: POOL_CONN
  }
)

FUNC = genfunc Q

{
  UNSAFE
  RAW
  LI
  LI0
  ONE
  ONE0
  EXE
  UPSERT
  ITER
} = FUNC

export UNSAFE = UNSAFE
export RAW = RAW
export LI = LI
export LI0 = LI0
export ONE = ONE
export ONE0 = ONE0
export EXE = EXE
export UPSERT = UPSERT
export ITER = ITER

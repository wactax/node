#!/usr/bin/env coffee

> ./index.js:Redis

{
  KV_DB
  KV_HOST_PORT
  KV_PASSWORD
  KV_RESP
  KV_USER
} = process.env

export default await Redis({
  REDIS_DB:KV_DB
  REDIS_HOST_PORT:KV_HOST_PORT
  REDIS_PASSWORD:KV_PASSWORD
  REDIS_RESP:KV_RESP
  REDIS_USER:KV_USER
})

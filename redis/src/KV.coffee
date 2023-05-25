#!/usr/bin/env coffee

> ./index.js:Redis

{
  REDIS_KV_DB          : REDIS_DB
  REDIS_KV_USER        : REDIS_USER
  REDIS_KV_PASSWORD    : REDIS_PASSWORD
  REDIS_KV_HOST_PORT   : REDIS_HOST_PORT
  REDIS_KV_RESP        : REDIS_RESP
} = process.env

export default await Redis({
  REDIS_USER
  REDIS_HOST_PORT
  REDIS_PASSWORD
  REDIS_DB
  REDIS_RESP
})

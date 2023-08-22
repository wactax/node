#!/usr/bin/env coffee

> ./index.js:Redis

{
  AK_DB
  AK_HOST_PORT
  AK_PASSWORD
  AK_RESP
  AK_USER
} = process.env

export default await Redis({
  REDIS_DB:AK_DB
  REDIS_HOST_PORT:AK_HOST_PORT
  REDIS_PASSWORD:AK_PASSWORD
  REDIS_RESP:AK_RESP
  REDIS_USER:AK_USER
})

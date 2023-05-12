#!/usr/bin/env coffee

> ./index.js:Redis

{
  REDIS_MQ_DB          : REDIS_DB
  REDIS_MQ_USER        : REDIS_USER
  REDIS_MQ_PASSWORD    : REDIS_PASSWORD
  REDIS_MQ_HOST_PORT   : REDIS_HOST_PORT
} = process.env

export default await Redis({
  REDIS_USER
  REDIS_HOST_PORT
  REDIS_PASSWORD
  REDIS_DB
})

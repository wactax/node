#!/usr/bin/env coffee

> ./index.js:Redis

{
  MQ_DB
  MQ_HOST_PORT
  MQ_PASSWORD
  MQ_USER
} = process.env

export default await Redis({
  REDIS_DB          : MQ_DB
  REDIS_HOST_PORT   : MQ_HOST_PORT
  REDIS_PASSWORD    : MQ_PASSWORD
  REDIS_USER        : MQ_USER
})

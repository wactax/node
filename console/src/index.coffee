#!/usr/bin/env coffee

import signale from '@rmw/signale'
{Signale} = signale

import {createWriteStream,readFileSync} from 'fs'
import {dirname,join} from 'path'
# import {package_json, project_name} from "@rmw/env"
import util from 'util'

STREAM = {}

fs_stream = (path)=>
  log = STREAM[path]
  if not log
    STREAM[path] = log = createWriteStream path, flags:"a"
  log

colors = process.stdout.hasColors?()

export class Console extends Signale
  assert:(assertion, args...)->
    if not assertion
      @log ...args
    return

  dir:(obj, options={})->
    options = {
      ...options
    }
    if colors
      options.colors = colors
    @log util.inspect(obj, options)
    return

  trace:(...args)->
    args.push "\n"+(new Error()).stack
    @error.apply @, args
    return

export default =>

  stream = []
  error_stream = []

  stream.push process.stdout
  error_stream.push process.stderr

  ###
  ERR = get 'ERR'
  LOG = get "LOG"

  if LOG
    log = fs_stream LOG
    stream.push(log)
    if not ERR
      error_stream.push log

  if ERR
    error_stream.push(fs_stream ERR)
  ###
  #
  c = new Console {
    stream
    types: {
      error: {
        stream: error_stream
      }
    }
  }
  opt = {
  }
  opt.displayFilename = true
  # opt.formatDate = "HH:mm:ss"
  # opt.displayDate = true
  c.config opt
  c

process.on 'exit', =>
  for s from Object.values STREAM
    s.close()

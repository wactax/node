#!/usr/bin/env coffee

export default =>
  new Date().toLocaleDateString('en-CA').replace(/\//g, '-')


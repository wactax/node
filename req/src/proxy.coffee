#!/usr/bin/env coffee

{https_proxy} = process.env

export default proxy = {}
if https_proxy
  console.log "use https_proxy",https_proxy
  Agent = (await import('https-proxy-agent')).default.HttpsProxyAgent
  global.fetch = (await import('node-fetch')).default
  proxy.agent = new Agent(https_proxy)


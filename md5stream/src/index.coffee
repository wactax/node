#!/usr/bin/env coffee

> stream
  util
  crypto

pipeline = util.promisify stream.pipeline

< (inputStream) =>
  new Promise (resolve, reject)=>
    hash = crypto.createHash 'md5'

    transformStream = new stream.Transform
      transform: (chunk, encoding, callback) =>
        hash.update chunk
        callback()
        return

    pipeline(inputStream, transformStream)
      .then =>
        resolve hash.digest()
      .catch reject
    return

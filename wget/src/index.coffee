> fs > createWriteStream mkdirSync
  util > promisify
  stream
  path > dirname

pipeline = promisify stream.pipeline
finished = promisify stream.finished

< (url, file)=>
  response = await fetch url
  mkdirSync(
    dirname file
    recursive: true
  )
  await pipeline response.body, createWriteStream file
  await finished response.body
  return

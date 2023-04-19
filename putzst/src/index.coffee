#!/usr/bin/env coffee

> fs/promises > mkdir unlink
  fs > createWriteStream createReadStream
  tar
  cppzst > compressStream
  path > dirname basename resolve
  stream/promises > finished
  @w5/ossput

< (dir)=>
  dir = resolve(dir)
  to = '/tmp/backup/'+dir[1..].replaceAll('/','+')
  await mkdir dirname(to),recursive: true
  file = to+'.tar'
  await tar.c(
    {
      gzip: false
      cwd: dirname dir
      file
    }
    [
      basename dir
    ]
    [
      dir
    ]
  )

  ext = '.tar.zst'
  ofp = to+ext
  out = createWriteStream(ofp)

  createReadStream(file)
    .pipe(compressStream())
    .pipe(out)

  await finished out
  await unlink file
  await ossput(
    basename(dir)+ext
    =>
      createReadStream ofp
    'application/x-zstd-compressed-tar'
  )
  await unlink ofp
  return


#!/usr/bin/env coffee

> ./trmd.js
  path > join dirname basename
  knex
  @w5/j2f
  @w5/blake3 > blake3Hash
  fs > statSync existsSync readFileSync
  @w5/bar:Bar
  @w5/read
  @w5/write
  @w5/u8 > u8eq
  @w5/utf8/utf8e.js
  @w5/utf8/utf8d.js
  os
  ./reset.js

DB = knex {
  client:  'sqlite3'
  useNullAsDefault: true
  connection: {
    filename: join os.homedir(),'.cache/trmd.db'
  }
}

table = 'file_size_mtime'
if not await DB.schema.hasTable table
  await DB.schema.createTable(
    table
    (table) =>
      table.integer('id').primary()
      table.string('path').notNullable().unique()
      table.integer('mtime').notNullable()
      table.integer('size').notNullable()
      return
  )


statIsChange = (path)=>
  {size, mtime} = statSync(path)
  mtime -= 0
  pre = await DB(table).where({path}).select('mtime','size').first()
  if pre
    no_change = pre.mtime == mtime and pre.size == size
  if not no_change
    return =>
      DB.raw(
        "INSERT INTO #{table} (path,mtime,size) VALUES (?,?,?) ON CONFLICT (path) DO UPDATE SET mtime=excluded.mtime,size=excluded.size"
        [
          path
          mtime
          size
        ]
      )
  return

< (from_file, to_fp, from_lang, to_lang_li)=>
  cache_dir = join dirname(from_file), '.i18n/cache'

  save = await statIsChange from_file
  no_change = not save

  name = basename(from_file)
  md_bin = readFileSync from_file
  md = utf8d md_bin
  md_hash_fp = join cache_dir, name+'.hash'

  if not no_change
    md_hash = blake3Hash md_bin
    if existsSync md_hash_fp
      pre = readFileSync md_hash_fp
      no_change = u8eq pre, md_hash

  bar = Bar to_lang_li.length
  for to_lang from to_lang_li
    bar()

    to_file = to_fp to_lang

    to_hash_fp = md_hash_fp + '.' + to_lang
    if from_lang == 'zh' and to_lang == 'zh-TW'
      write(
        to_file
        j2f md
      )
      continue
    cache_fp = join cache_dir, to_lang+'.'+name

    if existsSync to_file
      if no_change
        _save = await statIsChange to_file
        if not _save
          continue

        to_md = readFileSync to_file
        to_hash = blake3Hash to_md
        if existsSync to_hash_fp
          if u8eq to_hash, readFileSync to_hash_fp
            await _save()
            continue

        reset(
          md
          utf8d to_md
          cache_fp
        )
        write(
          to_hash_fp
          to_hash
        )
        await _save()
        continue

    bar.log from_lang,'→',to_file
    out = await trmd(
      cache_fp, md, from_lang, to_lang
    )
    write(
      to_file
      out
    )
    write(
      to_hash_fp
      blake3Hash utf8e out
    )

  await save?()
  if not no_change
    write(
      md_hash_fp
      md_hash
    )
  return


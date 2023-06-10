> ./_try.js:_try

< (PG)=>
  Q = _try (sql,args)=>
    return await PG(sql,...args).values()

  UNSAFE = _try (query, args...)=>
    PG.unsafe(query, args).values()

  {
    UNSAFE

    ITER : (table, column, limit=10000)->
      id = 0
      loop
        li = await UNSAFE(
          "SELECT id,#{column} FROM #{table} WHERE id>#{id} ORDER BY id LIMIT #{limit}"
        )
        len = li.length
        if len
          yield from li
        else
          id = li[len-1][0]
          break
      return

    RAW : _try (sql, args...)=>
      PG(sql,...args).raw()

    LI : (sql,args...)=>
      Q(sql,args)

    LI0 : (sql,args...)=>
      (await Q(sql,args)).map((i)=>i[0])

    ONE : (sql,args...)=>
      for i from await Q(sql,args)
        return i
      return

    ONE0 : (sql,args...)=>
      for i from await Q(sql,args)
        return i?[0]
      return

    EXE : _try (sql, args...)=>
      PG(sql,...args).execute()

    UPSERT : (table, kv, where_val)=>
      where= []
      column_li = []
      holder = []
      val_li = []

      if where_val
        column_val = Object.assign(kv, where_val)
      else
        where_val = column_val = kv

      n = 0
      for column,val of where_val
        where.push """#{column}=$"""+(++n)
        val_li.push val

      for column,val of column_val
        column = '"'+column+'"'
        column_li.push column
        holder.push "$"+(++n)
        val_li.push val

      update_li = []
      update_val_li = []
      for column,val of kv
        update_li.push("""\"#{column}"=$#{++n}""")
        update_val_li.push val
      update_li = update_li.join ','

      sql = """WITH S AS (SELECT id FROM #{table} WHERE #{where.join(' AND ')}),I AS (INSERT INTO #{table} (#{column_li.join(',')}) SELECT #{holder.join(",")} WHERE NOT EXISTS (SELECT 1 FROM S) RETURNING id),U AS (UPDATE #{table} SET #{update_li} WHERE id=(SELECT id FROM S)) SELECT id FROM I UNION ALL SELECT id FROM S"""
      li = val_li.concat(update_val_li)
      (await UNSAFE(
        sql
        ...li
      ))[0][0]
  }

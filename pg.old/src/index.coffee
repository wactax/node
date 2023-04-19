#!/usr/bin/env coffee

> pg:_pg
  pg-parse-float:pgParseFloat

pgParseFloat _pg
_pg.types.setTypeParser(20, parseInt)
_pg.types.setTypeParser(1016, (v)->
    if v=="{}"
        return []
    v = v.replace(/{/g,"[").replace(/}/g,"]")
    return JSON.parse(v)
)

> knex
  knex/lib/query/querybuilder.js:QueryBuilder

rowModeArray = rowMode:'array'

Object.assign(
  QueryBuilder::
  {
    get: (dict)->
      if parseInt(dict)
        dict = {id:dict}
      (
        await @where(dict).limit(1)
      )[0]

    get0:(dict)->
      r = await @get(dict)
      if r
        return r[0]

    li0:->
      r = []
      for i in await @
        r.push i[0]
      return r

    valId:(val)->
      val = {val}
      id = 'id'
      (
        await @select(id).get0(val)
      ) or (
        await @insert(val).returning(id)
      )[0][0]

    set:(dict, conflict)->
      if not conflict
        conflict = Object.keys dict
      r = await @insert(dict).returning('id').onConflict(conflict).merge()
      if r.length
        return r[0][0]
  }
)

< (uri)=>
  K = knex {
    client: 'pg'
    useNullAsDefault: true
    pool: { min: 1, max: 16 }
    acquireConnectionTimeout: 60000
    connection: "postgres://"+uri
  }

  Q = (args...)->
    {rows} = await K.raw(
      args[0]
      args[1..]
    ).options(rowModeArray)
    rows

  def = (o, schema, table)=>
    schema_table = schema + '.' + table
    Object.defineProperty o, table, {
      get:=>
        K(schema_table).options(rowModeArray)
    }
    return

  for [schema_name] from await Q(
    "select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')"
  )
    if schema_name != 'public'
      Q[schema_name] = o = {}
    else
      o = Q
    for [table] from await Q(
      "SELECT table_name as name FROM information_schema.tables WHERE table_schema='#{schema_name}' AND table_type='BASE TABLE'"
    )
      def o,schema_name,table

  Q


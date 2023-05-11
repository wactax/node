> @w5/u8 > U8 u8eq
  @w5/utf8/utf8e.js

hash = (bin)=>
  U8(await crypto.subtle.digest(
    name: "SHA-256"
    utf8e bin
  ))

bin2luaStr = (bin)=>
  li = []
  for i from bin
    li.push '\\'+i
  li.join ''

isFlags = (i)=>
  i.startsWith '-- flags '

NO_WRITES = '\'no-writes\''

< (redis)=>
  new Proxy(
    {}
    get:(_,name)=>
      (lua)=>
        ver_func = name+'Ver'
        lua = lua.trim()
        version = await hash lua
        try
          ver = await R.fbinR ver_func,[],[]
        catch
          ver = []
        if ver and u8eq version,ver
          console.log "-- redis lua #{name} version exist"
          return

        lua += """\n
function #{ver_func}()
  -- flags no-writes
  return "#{bin2luaStr version}"
end"""

        li = ["#!lua name=#{name}\n\n"]

        + function_name,body,flags

        func = =>
          if body[0] == '()'
            flags = flags or []
            if not flags.includes NO_WRITES
              flags.push NO_WRITES

          if flags
            li.push(
              """redis.register_function{
              function_name='#{function_name}',
              callback=function#{body.join('\n')},
              flags={#{flags}}
              }\n"""
            )
          else
            li.push(
              """redis.register_function('#{function_name}',function#{body.join('\n')})\n"""
            )
          flags = body = undefined
          return

        for i,pos in lua.split('\n')
          if i.startsWith 'function '
            i = i[8..].trim()
            pos = i.indexOf('(')
            function_name = i[...pos]
            ap = i.indexOf(')',pos)
            body = [
              i[pos..ap]
              '  redis.setresp(3)'+i[ap+1..]
            ]
          else if body
            trim = i.trim()
            if trim.startsWith '-- flags'
              t = []
              for i from trim[8..].split(' ')
                if i
                  t.push '\''+i+'\''
              flags = t.join(',')
            else
              body.push i
              if i == 'end'
                func()
          else
            li.push i+'\n'

        lua = li.join('').trim()
        await redis.fnload lua
        lua
  )

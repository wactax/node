export default "-- local log = function(...)\n--   local li = {}\n--   for _, v in ipairs({ ... }) do\n--     table.insert(li, cjson.encode(v))\n--   end\n--   redis.log(redis.LOG_NOTICE, unpack(li))\n-- end\n\nlocal XPENDING = function(stream, group, idle, limit)\n  return redis.call(\"XPENDING\", stream, group, \"IDLE\", idle, \"-\", \"+\", limit)\nend\n\nlocal XCLAIM = function(stream, group, customer, min_idle, ...)\n  return redis.call(\"XCLAIM\", stream, group, customer, min_idle, ...)\nend\n\nlocal XINFO = function(stream, group)\n  return redis.call(\"XINFO\", \"CONSUMERS\", stream, group)\nend\n\nlocal XDELCONSUMER = function(stream, group, consumer)\n  return redis.call(\"XGROUP\", \"DELCONSUMER\", stream, group, consumer)\nend\n\nfunction xconsumerclean(keys, args)\n  local stream, group = unpack(keys)\n  local expire = tonumber(args[1])\n  for _, v in ipairs(XINFO(stream, group)) do\n    local v = v.map\n    if v.idle > expire then\n      XDELCONSUMER(stream, group, v.name)\n    end\n  end\nend\n\nfunction xpendclaim(keys, args)\n  if #keys ~= 3 then\n    return\n  end\n  local stream, group, customer = unpack(keys)\n  local idle, limit = unpack(args)\n  idle = tonumber(idle)\n  local li = XPENDING(stream, group, idle, limit)\n  if #li > 0 then\n    local id_li = {}\n    local id_retry = {}\n    for _, v in ipairs(li) do\n      local id = v[1]\n      table.insert(id_li, id)\n      id_retry[id] = v[4]\n    end\n    local r = {}\n    for _, v in ipairs(XCLAIM(stream, group, customer, idle, unpack(id_li))) do\n      local id, msg = unpack(v)\n\n      for i, v in ipairs(msg) do\n        msg[i] = cmsgpack.unpack(v)\n      end\n\n      table.insert(msg, 1, id_retry[id])\n      table.insert(msg, 1, id)\n\n      table.insert(r, msg)\n    end\n    return cmsgpack.pack(r)\n  else\n    return\n  end\nend\n"

local log = function(...)
  local li = {}
  for _, v in ipairs({ ... }) do
    table.insert(li, cjson.encode(v))
  end
  redis.log(redis.LOG_NOTICE, unpack(li))
end

local merge = function(...)
  local result = {}
  for i, arr in ipairs({ ... }) do
    for j, val in ipairs(arr) do
      table.insert(result, val)
    end
  end
  return result
end

local intBin = function(n)
  local t = {}
  while n > 0 do
    local r = math.floor(math.fmod(n, 256))
    table.insert(t, r)
    n = (n - r) / 256
  end
  return t
end

local binPack = function(li)
  log('>>>',li)
  local lenli = {}
  local packed = {}

  for i = 1, #li do
    table.insert(lenli, #li[i])
    table.move(li[i], 1, #li[i], #packed + 1, packed)
  end

  lenli = cmsgpack.pack(lenli)
  local lenlilen = intBin(#lenli)

  local r = merge(lenlilen, lenli, packed)
  table.insert(r, 1, #lenlilen)
  return r
end

local XPENDING = function(stream, group, idle, limit)
  return redis.call("XPENDING", stream, group, "IDLE", idle, "-", "+", limit)
end

local XCLAIM = function(stream, group, customer, min_idle, ...)
  return redis.call("XCLAIM", stream, group, customer, min_idle, ...)
end

local XINFO = function(stream, group)
  return redis.call("XINFO", "CONSUMERS", stream, group)
end

local XDELCONSUMER = function(stream, group, consumer)
  return redis.call("XGROUP", "DELCONSUMER", stream, group, consumer)
end

function xconsumerclean(keys, args)
  local stream, group = unpack(keys)
  local expire = tonumber(args[1])
  for _, v in ipairs(XINFO(stream, group)) do
    local v = v.map
    if v.idle > expire then
      XDELCONSUMER(stream, group, v.name)
    end
  end
end

local splitNum = function(str)
  local pos = string.find(str, "-") -- 找到"-"的位置
  local str1 = string.sub(str, 1, pos - 1) -- 截取前半段字符串
  local str2 = string.sub(str, pos + 1) -- 截取后半段字符串
  local num1 = intBin(tonumber(str1)) -- 将前半段字符串转换为数字
  local num2 = intBin(tonumber(str2)) -- 将后半段字符串转换为数字
  return { num1, num2 } -- 返回两个数字
end

function xpendclaim(keys, args)
  if #keys ~= 3 then
    return
  end
  local stream, group, customer = unpack(keys)
  local idle, limit = unpack(args)
  idle = tonumber(idle)
  local li = XPENDING(stream, group, idle, limit)
  if #li > 0 then
    local id_li = {}
    local id_retry = {}
    for _, v in ipairs(li) do
      local id = v[1]
      table.insert(id_li, id)
      id_retry[id] = v[4]
    end
    local r = {}
    for _, v in ipairs(XCLAIM(stream, group, customer, idle, unpack(id_li))) do
      local id, msg = unpack(v)
      -- table.insert(r, intBin(id_retry[id]))
      -- table.move(splitNum(id), 1, 2, #r + 1, r)
      -- for _, v in ipairs(msg) do
      --   table.insert(r, v)
      -- end
    end
    return binPack(r)
  else
    return
  end
end

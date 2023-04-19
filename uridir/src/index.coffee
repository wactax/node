> path > dirname sep

# windows is "file:///c:/dev/node/walk/lib/test.js"

PREFIX_LEN = if sep == '\\' then 8 else 7

< thisfile = ({url}) =>
  decodeURI(url.slice(PREFIX_LEN))

< uridir = (meta) =>
  dirname(thisfile(meta))

< default uridir

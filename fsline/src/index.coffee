> readline
  fs

< (filepath)=>
  input = fs.createReadStream filepath
  readline.createInterface {
    input
    crlfDelay: Infinity
  }

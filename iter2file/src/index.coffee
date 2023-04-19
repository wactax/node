
import intoStream from 'into-stream'
import { pipeline } from 'stream/promises'
import {createWriteStream} from 'fs'

export iter2file = (path,iter)=>
  pipeline(
    intoStream iter
    createWriteStream path
  )

export default iter_func2file = (path,func)=>
  iter2file(path,func())

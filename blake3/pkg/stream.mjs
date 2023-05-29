  //!/usr/bin/env coffee
import {
  Writable
} from 'stream';

import {
  Blake3
} from './_.js';

export var Write = class Write extends Writable {
  constructor() {
    super(...arguments);
    this.blake3 = new Blake3();
    return;
  }

  _write(chunk, encoding, callback) {
    this.blake3.update(chunk);
    callback();
  }

};

export default (stream) => {
  var write;
  write = new Write();
  stream = stream.pipe(write);
  return new Promise((resolve) => {
    return write.on('finish', function() {
      resolve(this.blake3.finalize());
    });
  });
};

/* tslint:disable */
/* eslint-disable */
/**
*/
export class BinSet {
  free(): void;
/**
*/
  constructor();
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  add(val: Uint8Array): boolean;
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  has(val: Uint8Array): boolean;
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  delete(val: Uint8Array): boolean;
/**
* @returns {Uint8Array}
*/
  dump(): Uint8Array;
/**
* @param {Uint8Array} li
* @param {number} n
* @returns {BinSet}
*/
  static load(li: Uint8Array, n: number): BinSet;
/**
*/
  readonly size: number;
}

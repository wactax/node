/* tslint:disable */
/* eslint-disable */
/**
* @param {Float64Array} vs
* @returns {Uint8Array}
*/
export function vbyteE(vs: Float64Array): Uint8Array;
/**
* @param {Uint8Array} vs
* @returns {Float64Array}
*/
export function vbyteD(vs: Uint8Array): Float64Array;
/**
* @param {Float64Array} vs
* @returns {string}
*/
export function b64VbyteE(vs: Float64Array): string;
/**
* @param {string} vs
* @returns {Float64Array}
*/
export function b64VbyteD(vs: string): Float64Array;
/**
* @param {Uint8Array} bin
* @returns {string}
*/
export function b64E(bin: Uint8Array): string;
/**
* @param {string} bin
* @returns {Uint8Array}
*/
export function b64D(bin: string): Uint8Array;
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

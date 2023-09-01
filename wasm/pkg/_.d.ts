/* tslint:disable */
/* eslint-disable */
/**
* @param {number} n
* @returns {Uint8Array}
*/
export function u64Bin(n: number): Uint8Array;
/**
* @param {number} n
* @returns {string}
*/
export function u64B64(n: number): string;
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
* @param {Uint8Array} bin
* @returns {string}
*/
export function z85E(bin: Uint8Array): string;
/**
* @param {string} bin
* @returns {Uint8Array}
*/
export function z85D(bin: string): Uint8Array;
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
* @param {Float64Array} vs
* @returns {string}
*/
export function z85VbyteE(vs: Float64Array): string;
/**
* @param {string} vs
* @returns {Float64Array}
*/
export function z85VbyteD(vs: string): Float64Array;
/**
*/
export class BinMap {
  free(): void;
/**
*/
  constructor();
/**
*/
  clear(): void;
/**
* @param {Uint8Array} key
* @returns {boolean}
*/
  delete(key: Uint8Array): boolean;
/**
* @param {Uint8Array} key
* @param {any} val
*/
  set(key: Uint8Array, val: any): void;
/**
* @param {Uint8Array} key
* @returns {any}
*/
  get(key: Uint8Array): any;
/**
*/
  readonly size: number;
}
/**
*/
export class BinSet {
  free(): void;
/**
*/
  constructor();
/**
* @returns {(Uint8Array)[]}
*/
  clear(): (Uint8Array)[];
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
*/
  readonly size: number;
}

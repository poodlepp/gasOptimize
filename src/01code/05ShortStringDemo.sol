// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * short string which less than 32 bytes  just capture 1 slot;
 * so limit the string in 32 bytes is meaningful.
 *
 * short string   0x  length*2  ---   data
 * long string   slot0  just length*2+1     slot[keccak256(abi.encode(0))] 存放data ...
 */

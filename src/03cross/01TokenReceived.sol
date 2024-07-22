// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 01转账钩子
 *
 * ERC1155
 * ERC721  safeTransfer   safeMint
 * ERC1363  transferAndCall
 * ERC777 已经弃用
 */

/**
 * 02 转账
 * fallback   receive 代替  deposit
 * 需要考虑具体情况
 */

/**
 * 03 ERC2930 访问列表交易
 * 指定function, slot  预热存储槽
 * 在js中使用
 * 预付一部分gas，能够享受gas折扣
 * 跨合约调用，总是应该使用访问列表交易
 */

/**
 * 04 oracle 价格，能缓存就缓存  memory
 */

/**
 * 05 multicall
 */

/**
 * 06 单体架构  调用成本低于 合约交互
 */

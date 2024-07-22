// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 01 汇编revert 节省300gas
 * 02 合约间调用 参数会存储在新的内存位置；
 *      通过opcode 可以复用之前空置的内存位置，约束： 数据小于64字节
 *      通过assembly 调用set(uint256) 节省220gas
 * 03 数学比大小 solady Library 也许有更优秀的工具
 *      类似场景也是一样的
 * 04 SUB  XOR 是更优的不等式工具
 * 05 address(0) 检查
 * 06 address(this).balance -> selfbalance()  有时编译器自己就优化了
 * 07 积极使用内存前128字节，最多有96字节可以使用
 *      64+32+32  用完要恢复
 * 08 multicall  复用内存地址，减少内存扩展
 * 09 创建多个合约时  复用内存空间
 * 10 位运算 来取模，更加高效
 */

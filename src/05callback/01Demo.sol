// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * calldata  零字节收取4gas,  非零字节收取16gas
 *
 * 01 calldata中更多0  可以节省gas
 * 02 尽量不使用有符号整数，使用补码存储，更大概率出现超多的1
 * 03 calldata  优先于 memory
 * 04 solidity内部会对变量自动进行打包（当然不如手工打包）
 *      calldata是不会自动打包的，自定义编码能够提高效率，需要综合考虑
 */

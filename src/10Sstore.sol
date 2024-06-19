/**
 * SSTORE Key-value 都是32bytes
 * SSTORE 32bytes 22100gas   690gas/byte
 * 写入智能合约 200gas/byte
 */

/**
 * 对于大量的仅需写入一次的数据  应该考虑SSTORE2
 * CREATE EXTCODECOPY  其实是以合约代码的形式来存储了，细节暂不研究，部署的地址取决于数据
 * CREATE2 是类似的原理
 */

/**
 * SSTORE3 部署地址与数据无关
 * 仅通过salt 计算出地址，降低存储成本
 */

/**
 * 总结
 * SSTORE2 在写操作很少但读操作频繁（且指针 > 14字节）的情况下很有帮助。
 * SSTORE3 在你很少写入但经常读取的情况下更好（且指针 < 14字节）。
 */
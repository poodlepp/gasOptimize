/**
 * SSTORE Key,value 都是32bytes
 * SSTORE 32bytes 22100gas   690gas/byte
 * 写入智能合约 200gas/byte
 */

/**
 * 对于大量的仅需写入一次的数据  应该考虑SSTORE2
 * CREATE存   代替SSTORE
 * EXTCODECOPY取   代替 SLOAD
 * 其实是以合约代码的形式来存储了，细节暂不研究，部署的地址取决于数据
 * 需要返回并保存合约地址  以便将来使用
 */

/**
 * SSTORE3 部署地址与数据无关
 * 仅通过salt 计算出地址，降低存储成本
 * 过程：  先SSTORE  然后CREATE2 根据salt计算出数据的指针地址
 * 读取时 还是使用EXTCODECOPY
 * 不需要保存合约地址，即时计算出来
 */

/**
 * 总结
 * SSTORE2 在写操作很少但读操作频繁（且指针 > 14字节）的情况下很有帮助。
 * SSTORE3 在你很少写入但经常读取的情况下更好（且指针 < 14字节）。
 * 我猜区别是因为SSTORE2 需要额外存储一个合约地址，这是不同之处。
 */

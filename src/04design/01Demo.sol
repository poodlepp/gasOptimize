// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 01 multidelegatecall
 * 02 ECDSA 签名  代替  merkle tree； 更便宜
 * 03 ERC20Permit  使用签名来进行授权转账
 *  很多优势 节省gas,提高体验，增强安全性 等等
 * 04 游戏等场景用L2
 * 05 状态通道 古老的方式，共享签名。。
 * 06 委托投票
 * 07 ERC1155 能管理多种ERC721,ERC20  尤其是多种token场景，性能提升明显
 * 08 ERC1155 转账方法上有回调，如果不需要可以使用ERC6909代替
 * 09 UUPS 相对 透明代理更省gas；  透明代理需要proxy1967读取管理员地址验证，UUPS更省gas
 * UUPS和透明代理模式之间的选择取决于以下因素：
 *
 *     气体效率:与透明代理相比，UUPS更高效。
 *     灵活性: UUPS提供删除升级能力。
 *     实现复杂性:透明代理相对容易实现，使用范围更广。
 * 10 不只考虑openzeppelin，solmate,solady 有时有更优选择，更多的使用了高效语法，汇编等
 */

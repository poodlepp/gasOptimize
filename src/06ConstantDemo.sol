// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * constant 变量 直接添加在合约字节码中，200gas/byte
 * 增加了部署成本，但是避免了storage读取成本
 *
 * immutable  存储在合约字节码的特殊位置
 * 读取成本很低，接近constant
 * @author
 * @notice
 */
contract Constants {
    uint256 constant MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    function get_max_value() external pure returns (uint256) {
        return MAX_UINT256;
    }
}

// This uses more gas than the above contract    （1 contract deploy   2  variable read）
contract NoConstants {
    uint256 MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    function get_max_value() external view returns (uint256) {
        return MAX_UINT256;
    }
}

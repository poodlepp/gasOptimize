// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Constants {
    uint256 constant MAX_UINT256 =
        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    function get_max_value() external pure returns (uint256) {
        return MAX_UINT256;
    }
}

// This uses more gas than the above contract    （1 contract deploy   2  variable read）
contract NoConstants {
    uint256 MAX_UINT256 =
        0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    function get_max_value() external view returns (uint256) {
        return MAX_UINT256;
    }
}

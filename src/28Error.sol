// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

// 4bytes
contract CustomError {
    error InvalidAmount();

    function withdraw(uint256 _amount) external pure {
        if (_amount > 10 ether) revert InvalidAmount();
    }
}

// 64bytes
// This uses more gas than the above contract
contract NoCustomError {
    function withdraw(uint256 _amount) external pure {
        require(_amount <= 10 ether, "Error: Pass in a valid amount");
    }
}

/**
 * 29
 * 使用现有的create2工厂，而不是自己创建
 * 复用
 */

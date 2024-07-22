// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 操作	部署	受限操作1	受限操作2	受限操作3
 * 修饰器	195435	28367	28377	28411
 * 内部函数	159309	28391	28401	28435
 *
 * Abviously, internal functions are more gas-efficient than modifiers in deployment.
 *
 * At the same time, modifiers are more gas-efficient than internal functions in function execution.
 * Gas used will inrease when more functions add modifier.
 * 24 gas will be saved per call
 */

/**
 * deployment gas cost: 195435
 *     gas per call:
 *               restrictedAction1: 28367
 *               restrictedAction2: 28377
 *               restrictedAction3: 28411
 */
contract Modifier {
    address owner;
    uint256 val;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function restrictedAction1() external onlyOwner {
        val = 1;
    }

    function restrictedAction2() external onlyOwner {
        val = 2;
    }

    function restrictedAction3() external onlyOwner {
        val = 3;
    }
}

/**
 * deployment gas cost: 159309
 *     gas per call:
 *               restrictedAction1: 28391
 *               restrictedAction2: 28401
 *               restrictedAction3: 28435
 */
contract InternalFunction {
    address owner;
    uint256 val;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() internal view {
        require(msg.sender == owner);
    }

    function restrictedAction1() external {
        onlyOwner();
        val = 1;
    }

    function restrictedAction2() external {
        onlyOwner();
        val = 2;
    }

    function restrictedAction3() external {
        onlyOwner();
        val = 3;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MemoryDemo {
    uint256 public number;

    /**
     * SLOAD 2000GAS   后续每次100gas
     * SSTORE 更新100gas
     *
     * SLOAD 存入内存  后续每次3gas
     */
    function increment1() public {
        require(number < 10);
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
        number = number + 1;
    }

    // read once is better than read twice
    function increment2() public {
        uint256 _number = number;
        require(_number < 10);
        number = _number + 1;
    }
}

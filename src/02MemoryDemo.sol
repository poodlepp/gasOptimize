// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract MemoryDemo {
    uint256 public number;

    /**
     * A small times of reading storage is reommended.
     * Managing memory is cheaper.
     */
    function increment1() public {
        require(number < 10);
        number = number + 1;
    }

    // read once is better than read twice
    function increment2() public {
        uint256 _number = number;
        require(_number < 10);
        number = _number + 1;
    }
}

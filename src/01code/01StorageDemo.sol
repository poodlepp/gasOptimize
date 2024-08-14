// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * The first assignment of a storage variable incurs particularly high gas costs.
 * nums   20000
 * constantNums   22100gas/slot
 * Update operation just cost little gas comparably.
 * 100gas
 * 
 * Big number or little number does not matter  (selector过程会影响gas， type.max 会影响gas).
 *
 * if you want to manage two states ,1&2 is better than 0&1
 */
contract StorageDemo {
    uint256[100] public constantNums;
    uint256[] public nums;

    function constantAddLittleNum() public {
        constantNums[0] = 1;
    }

    function constantAddBigNum() public {
        constantNums[0] = type(uint256).max;
    }

    function constantAdd_100_LittleNum() public {
        for (uint256 i = 0; i < 100; i++) {
            constantNums[i] = 1;
        }
    }

    function constantAdd_100_BigNum() public {
        for (uint256 i = 0; i < 100; i++) {
            constantNums[i] = type(uint256).max;
        }
    }

    function constantUpdateNum() public {
        constantNums[0] = 1;
        // for (uint256 i = 0; i < 1000; i++) {

        // }
    }

    function addLittleNum() public {
        nums.push(1);
    }

    function add_100_LittleNum() public {
        for (uint256 i = 0; i < 100; i++) {
            nums.push(1);
        }
    }

    function addBigNum() public {
        nums.push(type(uint256).max);
    }

    function add_100_BigNum() public {
        for (uint256 i = 0; i < 100; i++) {
            nums.push(type(uint256).max);
        }
    }

    function updateNum() public {
        nums[0] = 1;
        // for (uint256 i = 0; i < 1000; i++) {

        // }
    }
}

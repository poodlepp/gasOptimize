// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "../src/01code/02MemoryDemo.sol";

contract MemoryDemoTest is Test {
    MemoryDemo instance;

    function setUp() public {
        instance = new MemoryDemo();
    }

    function testIncrement1() public {
        instance.increment1();
    }

    function testIncrement2() public {
        instance.increment2();
    }
}

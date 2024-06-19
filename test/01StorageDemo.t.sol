// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/01StorageDemo.sol";
import "forge-std/console.sol";

contract StorageDemoTest is Test {
    StorageDemo instance;

    modifier logGas() {
        uint256 gasBefore = gasleft();
        _;
        uint256 gasAfter = gasleft();
        uint256 gasUsed = gasBefore - gasAfter;
        console.log("Gas used1:", gasUsed);
    }

    function setUp() public {
        instance = new StorageDemo();
    }

    function testConstantaddlittlenum() public {
        instance.constantAddLittleNum();
    }

    function testConstantaddbignum() public {
        instance.constantAddBigNum();
    }

    function testConstantadd_100_littlenum() public {
        instance.constantAdd_100_LittleNum();
    }

    function testConstantadd_100_bignum() public {
        instance.constantAdd_100_BigNum();
    }

    function testConstantUpdateNum() public logGas {
        instance.constantUpdateNum();
    }

    function testAddlittlenum() public {
        instance.addLittleNum();
    }

    function testAdd_100_littlenum() public {
        instance.add_100_LittleNum();
    }

    function testAddbignum() public {
        instance.addBigNum();
    }

    function testAdd_100_bignum() public {
        instance.add_100_BigNum();
    }

    function testUpdateNum() public {
        uint256 gasBefore = gasleft();
        instance.addBigNum();
        uint256 gasAfter = gasleft();
        uint256 gasUsed = gasBefore - gasAfter;
        console.log("Gas used add:", gasUsed);

        uint256 gasBefore2 = gasleft();
        instance.updateNum();
        uint256 gasAfter2 = gasleft();
        uint256 gasUsed2 = gasBefore2 - gasAfter2;
        console.log("Gas used update:", gasUsed2);
    }

    // uint256 gasBefore = gasleft();
    // uint256 gasAfter = gasleft();
    // uint256 gasUsed = gasBefore - gasAfter;
    // console.log("Gas used2:", gasUsed);
}

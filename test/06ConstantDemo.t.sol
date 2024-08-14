// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/01code/06ConstantDemo.sol";

contract ConstantDemoTest is Test {
    // function setUp() public {
    //     instance = new GasPackageDemo();
    // }

    function testSetUpConstant1() public {
        Constants ct = new Constants();
    }

    function testSetUpConstant1Get() public {
        Constants ct = new Constants();
        ct.get_max_value();
    }

    function testSetUpConstant2() public {
        NoConstants ct = new NoConstants();
    }

    function testSetUpConstant2Get() public {
        NoConstants ct = new NoConstants();
        ct.get_max_value();
    }
}

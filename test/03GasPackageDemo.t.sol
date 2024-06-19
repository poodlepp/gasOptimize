// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/03GasPackageDemo.sol";

contract GasPackageDemoTest is Test {
    GasPackageDemo instance;

    function setUp() public {
        instance = new GasPackageDemo();
    }

    function testPackvariables() public {
        instance.packVariables(100000000, 200000000);
    }

    function testUnpackvariables() public {
        instance.packVariables(100000000, 200000000);
        instance.unpackVariables();
    }

    function testUpdatevars2() public {
        instance.updateVars2(100000000, 200000000);
    }

    function testLoadvars2() public {
        instance.updateVars2(100000000, 200000000);
        instance.loadVars2();
    }

    function testUpdatevars3() public {
        instance.updateVars3(100000000, 200000000);
    }

    function testLoadvars3() public {
        instance.updateVars3(100000000, 200000000);
        instance.loadVars3();
    }
}

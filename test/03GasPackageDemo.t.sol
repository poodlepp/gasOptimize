// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {GasPackageDemo, GasPackageDemo2, GasPackageDemo3} from "../src/03GasPackageDemo.sol";

contract GasPackageDemoTest is Test {
    GasPackageDemo instance;
    GasPackageDemo2 instance2;
    GasPackageDemo3 instance3;

    function setUp() public {
        instance = new GasPackageDemo();
        instance2 = new GasPackageDemo2();
        instance3 = new GasPackageDemo3();
    }

    function testPackvariables() public {
        instance.packVariables(100000000, 200000000);
    }

    function testUnpackvariables() public {
        instance.packVariables(100000000, 200000000);
        instance.unpackVariables();
    }

    function testUpdatevars2() public {
        instance2.updateVars2(100000000, 200000000);
    }

    function testLoadvars2() public {
        instance2.updateVars2(100000000, 200000000);
        instance2.loadVars2();
    }

    function testUpdatevars3() public {
        instance3.updateVars3(100000000, 200000000);
    }

    function testLoadvars3() public {
        instance3.updateVars3(100000000, 200000000);
        instance3.loadVars3();
    }
}

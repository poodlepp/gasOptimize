// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract GasPackageDemo {
    // Manual packing is the most gas-saving.
    uint160 public packedVariables;

    function packVariables(uint80 x, uint80 y) external {
        packedVariables = (uint160(x) << 80) | uint160(y);
    }

    function unpackVariables() external view returns (uint80, uint80) {
        uint80 x = uint80(packedVariables >> 80);
        uint80 y = uint80(packedVariables);
        return (x, y);
    }

    // evm packing
    uint80 public var1;
    uint80 public var2;

    function updateVars2(uint80 x, uint80 y) external {
        var1 = x;
        var2 = y;
    }

    function loadVars2() external view returns (uint80, uint80) {
        return (var1, var2);
    }

    // no packing
    uint256 public var3;
    uint256 public var4;

    function updateVars3(uint256 x, uint256 y) external {
        var3 = x;
        var4 = y;
    }

    function loadVars3() external view returns (uint256, uint256) {
        return (var3, var4);
    }
}

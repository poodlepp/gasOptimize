// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 07 使用mapping 代替  array
 * 在get查询的场景，可以节省约1/3的gas消耗
 * array[1]  默认会包含长度检测，mapping没有这个步骤
 * 也要注意实际场景中的区别，不能无脑替换
 * 见下面demo
 */

/**
 * 08  另一种实现方式
 * 也可以在array的基础上 实现同样的效果
 * openzeppelin   Arrays.sol  unsafeAccess
 * 同样是跳过了长度的检查，自己要确保不会越界
 * @notice
 */

/// get(0) gas cost: 4860
contract Array {
    uint256[] a;

    constructor() {
        a.push() = 1;
        a.push() = 2;
        a.push() = 3;
    }

    function get(uint256 index) external view returns (uint256) {
        return a[index];
    }
}

/// get(0) gas cost: 2758
contract Mapping {
    mapping(uint256 => uint256) a;

    constructor() {
        a[0] = 1;
        a[1] = 2;
        a[2] = 3;
    }

    function get(uint256 index) external view returns (uint256) {
        return a[index];
    }
}

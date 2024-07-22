// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "./Target.sol";

contract Source {
    Target target;

    constructor(Target _target) {
        target = _target;
    }

    function callTarget() public {
        target.doSomething();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract ConstructorPayable {
    /**
     * By default, the constructor is not payable through adding the code bolow.
     * require(msg.value == 0)
     * This is the default hidden behavior of the constructor，which do not apply to non-constructor functions.
     *
     * So,if you make the constructor payable, the requiring code will be removed, gas will be saved.
     *
     *
     * non-constructor functions   ???  im not sure.
     * non-constructor funstions are used by external users, non payable maybe is more safe.
     * non-constructor functions which used by admin, payable will be better.
     */
    constructor() payable {}
}

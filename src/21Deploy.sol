// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {LibRLP} from "https://github.com/vectorized/solady/blob/main/src/utils/LibRLP.sol";

/**
 * Gas saving in deployment
 *
 * In this case, we deploy two contracts which connected each other using the deployer contract.
 * The deployer contract is a one-time deployer that deploys the two contracts and returns their addresses.
 * The deployer contract uses the LibRLP library to compute the addresses of the contracts.
 * Obviously, it's a implementation of the CREATE2 opcode.
 *
 * This implementation is a more efficient way to deploy contracts which may save several thoudsands of gas.
 * @author
 * @notice
 */

contract StorageContract {
    address public immutable writer;
    uint256 public x;

    constructor(address _writer) {
        writer = _writer;
    }

    // cost: 47158
    function setX(uint256 x_) external {
        require(msg.sender == address(writer), "only writer can set");
        x = x_;
    }
}

contract Writer {
    StorageContract public immutable storageContract;

    constructor(StorageContract _storageContract) {
        storageContract = _storageContract;
    }

    function set(uint256 x_) external {
        storageContract.setX(x_);
    }
}

// one time deployer.
contract BurnerDeployer {
    using LibRLP for address;

    function deploy()
        public
        returns (StorageContract storageContract, address writer)
    {
        StorageContract storageContractComputed = StorageContract(
            address(this).computeAddress(2)
        ); // contracts nonce start at 1 and only increment when it creates a contract
        writer = address(new Writer(storageContractComputed)); // first creation happens here using nonce = 1
        storageContract = new StorageContract(writer); // second create happens here using nonce = 2
        require(
            storageContract == storageContractComputed,
            "false compute of create1 address"
        ); // sanity check
    }
}

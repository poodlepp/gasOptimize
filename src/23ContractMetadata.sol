// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

// https://learnblockchain.cn/article/5879

/**
 * 53 byts metadata will add to the contract bytecode when deployed.
 * The 53 bytes metadata is the IPFS hash of the metadata file.  U can remove the metadata by setting --no-cbor-metadata such as:
 * solc --optimize-runs 1000 --bin --no-cbor-metadata C.sol
 *
 * But we can not verify the contract bytecode without the metadata.
 *
 * Even though, we can modity the objects like notes to impore the zero in IPFS hash which will also save some gas.
 *
 * 53 bytes metadata will cost 200 * 53 gas in storage and (16 or 4) *53 gas in calldata.
 * (non-zero-byte: 16gas, zero-byte: 4gas)
 *
 * In general, it does not play a big role.
 */
contract ContractMetadata {
    constructor() payable {}
}

/**
 * 24
 * Sometimes, the contract is designed to be used once,as like a deployer;
 * In this case, self-destructing the contract after deployment is a good practice to save gas.
 */

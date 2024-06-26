// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * Sometimes,the contract we are going to deploy is similar to one existing contract.
 * In this case,we can create a proxy contract that delegates some calls to the existing contract,at the same time,
 * process some calls itself.
 *
 * some sample:
 * EIP-1167 mini proxy
 * EIP-3348 meta clone
 */

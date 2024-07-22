// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * 12 The value of storage transfer from 1 to 0 is expensive.
 * Updating the balance of token to 0 will increase the situation above.
 * So making zero is not a good idea.
 */

/**
 * 13  从 n 倒数到零比从零到 n 进行计数更省 gas
 * 更少的循环次数: 在从 n 倒数到零的过程中，循环的次数总是 n 次，而从零到 n 进行计数，循环的次数可能多达 n + 1 次。这是因为在从零到 n 的循环中，如果计数器达到 n 后继续循环，则会造成溢出，导致错误结果。为了避免这种情况，需要在循环条件中加入额外的判断，使得循环在计数器达到 n 时停止。这也就导致了额外的循环次数。
 *
 *    更少的存储器访问: 在从 n 倒数到零的过程中，每次循环只需要访问一次存储器中的计数器变量，并将其值减一。而从零到 n 进行计数，每次循环都需要访问两次存储器中的计数器变量：一次是读取其值，另一次是将其值加一。
 *
 *    更少的 gas 退还: 在 Solidity 中，对于循环，只有在每次循环迭代结束后才会进行 gas 退还。因此，从 n 倒数到零的循环，由于循环次数更少，因此可以获得更多的 gas 退还。
 */

/**
 * 14  The timestamp of uint48 traval through several million years. don't need uint256
 *
 * There will be a new block every 15 seconds.   don't need uint256
 */

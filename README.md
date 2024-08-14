## There is a project about how to optimize the gas system in a building.
## Most of the skills come from RareSkills.


## User Guide
Some of the techniques in this article are not universally applicable and will be marked.

remixd -s /Users/lipengyi/solSecond/gasOptimize -u https://remix.ethereum.org


forge test --gas-report
forge test -vv    # look the console logs

options:
--match-contract ConstantDemoTest

demo:
forge test --match-contract ConstantDemoTest --gas-report -vvvvv
forge test --match-test ***
forge test --debug "testFuzz_CantMintToZeroAddress2()"
forge debug --debug src/01code/02MemoryDemo.sol --target-contract MemoryDemo --sig "increment1()"

notes:
- 一些优化经验在实际情况中可能并不理想，编译器有时是不可预测的，所以以实际验证为准
- 可读性也是需要考虑的
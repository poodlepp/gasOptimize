import re
import argparse
import os

def generate_test_code(input_filename, output_filename):
    # 定义输入和输出文件的相对路径
    input_filepath = os.path.join('../src/', input_filename)
    output_filepath = os.path.join('../test/', output_filename)

    # 读取智能合约文件
    with open(input_filepath, 'r') as file:
        contract_code = file.read()

    # 匹配所有函数定义
    functions = re.findall(r'function\s+(\w+)\s*\(.*?\)\s*', contract_code)

    # 生成测试代码
    test_code = """
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract ContractTest is Test {
    Contract instance;

    function setUp() public {
        instance = new Contract();
    }
"""

    for function in functions:
        test_code += f"""
    function test{function.capitalize()}() public {{
        instance.{function}();
    }}
"""

    test_code += """
}
"""

    # 将生成的测试代码写入文件
    with open(output_filepath, 'w') as file:
        file.write(test_code)

    print(f"测试代码已生成并写入 {output_filepath} 文件！")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate test code for Solidity contract functions")
    parser.add_argument("input_filename", help="The input Solidity contract file name")
    parser.add_argument("output_filename", help="The output test file name")

    args = parser.parse_args()

    generate_test_code(args.input_filename, args.output_filename)

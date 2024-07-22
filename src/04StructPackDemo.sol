// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

// The order of variables affects the slot allocation.

contract StructPackDemo {
    struct unpackedStruct {
        uint64 time; // Takes one slot - although it  only uses 64 bits (8 bytes) out of 256 bits (32 bytes).
        uint256 money; // This will take a new slot because it is a complete 256 bits (32 bytes) value and thus cannot be packed with the previous value.
        address person; // An address occupies only 160 bits (20 bytes).
    }

    // Starts at slot 0
    unpackedStruct details1 = unpackedStruct(53_000, 21_000, address(0xdeadbeef));

    function unpack1() external view returns (unpackedStruct memory) {
        return details1;
    }

    struct packedStruct {
        uint64 time; // In this case, both `time` (64 bits) and `person` (160 bits) are packed in the same slot since they can both fit into 256 bits (32 bytes)
        address person; // Same slot as `time`. Together they occupy 224 bits (28 bytes) out of 256 bits (32 bytes).
        uint256 money; // This will take a new slot because it is a complete 256 bits (32 bytes) value and thus cannot be packed with the previous value.
    }

    // Starts at slot 0
    packedStruct details2 = packedStruct(53_000, address(0xdeadbeef), 21_000);

    function unpack2() external view returns (packedStruct memory) {
        return details2;
    }
}

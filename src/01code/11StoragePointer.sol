// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

/**
 * The first implementation should read the whole user struct from storage, which is not necessary.
 * And then put all variables in memory, which is unnecessary.
 * The second implementation saves about 5,000 gas by using the `storage` keyword to declare the `User` struct.
 */

contract StoragePointerUnOptimized {
    struct User {
        uint256 id;
        string name;
        uint256 lastSeen;
    }

    constructor() {
        users[0] = User(0, "John Doe", block.timestamp);
    }

    mapping(uint256 => User) public users;

    function returnLastSeenSecondsAgo(
        uint256 _id
    ) public view returns (uint256) {
        User memory _user = users[_id];
        uint256 lastSeen = block.timestamp - _user.lastSeen;
        return lastSeen;
    }
}

// This results in approximately 5,000 gas savings compared to the previous version.
contract StoragePointerOptimized {
    struct User {
        uint256 id;
        string name;
        uint256 lastSeen;
    }

    constructor() {
        users[0] = User(0, "John Doe", block.timestamp);
    }

    mapping(uint256 => User) public users;

    function returnLastSeenSecondsAgoOptimized(
        uint256 _id
    ) public view returns (uint256) {
        User storage _user = users[_id];
        uint256 lastSeen = block.timestamp - _user.lastSeen;
        return lastSeen;
    }
}

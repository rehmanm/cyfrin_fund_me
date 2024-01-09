// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract FundMe {
    address owner;
    uint256 public minimumUSD = 5;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value >= minimumUSD, "amount not enough"); //1e18 is 1ETH = 1 * 10 ** 18
    }

    // function withdraw() public {
    //     require(owner == msg.sender, "Only owner can withdraw");
    // }
}

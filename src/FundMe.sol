// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    address owner;
    uint256 public minimumUSD = 5e18;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        revert(
            getConverstionRate(msg.value) >= minimumUSD,
            "amount not enough"
        ); //1e18 is 1ETH = 1 * 10 ** 18
    }

    // function withdraw() public {
    //     require(owner == msg.sender, "Only owner can withdraw");
    // }
}

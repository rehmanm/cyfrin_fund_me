// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    address public immutable i_owner;
    uint256 public constant MINIMUM_USD = 5e18;
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(
            PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD,
            "amount not enough"
        ); //1e18 is 1ETH = 1 * 10 ** 18
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    modifier onlyOwner() {
        // require(msg.sender == owner);
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        /*
        //transfer (limit 2300 gas and return error)
        payable(msg.sender).transfer(address(this).balance);

        //send  (limit 2300 gas and return bool)
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed"); //revert required in case it is failed to send balance

        */
        //call you can call any method with all the gas
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Calls Failed"); //revert required in case it is failed to send balance
    }

    //Fallback

    //receive
    //fallback
}

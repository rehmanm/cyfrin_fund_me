// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() public {
        //Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI:

        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (
            ,
            /* uint80 roundID */ int price /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/,
            ,
            ,

        ) = priceFeed.latestRoundData();
        return uint256(price) * 1e10;
    }

    function getConverstionRate(unit256 ethAmount) public returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountinUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountinUsd;
    }
}

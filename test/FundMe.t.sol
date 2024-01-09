// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe public fundMe;

    function setUp() public {
        fundMe = new FundMe();
    }

    function test_fund_small_amount() public {
        vm.expectRevert("amount not enough");
        fundMe.fund{value: 1 wei}();
    }

    function test_fund_correct_amount() public {
        uint256 balance_before = address(fundMe).balance;
        fundMe.fund{value: 1 ether}();
        uint256 balance_after = address(fundMe).balance;
        assertEq(balance_after, balance_before + 1 ether);
    }
}

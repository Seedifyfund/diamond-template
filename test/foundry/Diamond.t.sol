// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {IDiamondReadable} from "solidstate-solidity/proxy/diamond/readable/IDiamondReadable.sol";

import {RandomnessSetUp} from "./setUp/RandomnessSetUp.sol";

contract RandomnessBaseTest is RandomnessSetUp {
    function setUp() public override {
        super.setUp();
    }

    /*//////////////////////////////////////////////////////////////
                            DIAMOND BASICS
    //////////////////////////////////////////////////////////////*/
    function test_lotteryId_FetchFacetAddressFromFunctionSignature() public {
        address facetAddress = IDiamondReadable(address(diamond)).facetAddress(
            bytes4(keccak256("lotteryId()"))
        );

        assertTrue(facetAddress != address(0));
    }
}

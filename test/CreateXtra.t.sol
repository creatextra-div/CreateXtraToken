// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken token;

    address recipient = address(0xBEEF);

    function setUp() public {
        token = new MyToken();
    }

    function testTokenName() public view {
        assertEq(token.name(), "CreateXtraToken");
    }

    function testTokenSymbol() public view {
        assertEq(token.symbol(), "CXT");
    }

    function testInitialSupply() public view {
        assertEq(token.totalSupply(), 1_000_000 * 10 ** 18);
    }

    function testInitialSupplyBelongsToDeployer() public view {
        assertEq(token.balanceOf(address(this)), 1_000_000 * 10 ** 18);
    }

    function testTransfer() public {
        token.transfer(recipient, 100 * 10 ** 18);
        assertEq(token.balanceOf(recipient), 100 * 10 ** 18);
    }

    function testBurn() public {
        token.burn(100 * 10 ** 18);
        assertEq(token.totalSupply(), 999_900 * 10 ** 18);
    }
}

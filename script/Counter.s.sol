// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract CreateXtraTokenScript is Script {
    MyToken public token;

    function run() public {
        vm.startBroadcast();

        token = new MyToken();

        vm.stopBroadcast();
    }
}

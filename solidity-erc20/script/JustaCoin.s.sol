// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/JustaCoin.sol";

contract DeployJustaCoin is Script {
    uint256 internal constant INIT_SUPPLY = 1_000_000 ether;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new JustaCoin(INIT_SUPPLY);

        vm.stopBroadcast();
    }
}

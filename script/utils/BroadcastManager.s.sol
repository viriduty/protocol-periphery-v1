// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import { Script } from "forge-std/Script.sol";

contract BroadcastManager is Script {
    address public multisig;
    address public deployer;

    function _beginBroadcast() internal {
        uint256 deployerPrivateKey;
        if (block.chainid == 1) { // Tenderly mainnet fork
            deployerPrivateKey = vm.envUint("MAINNET_PRIVATEKEY");
            deployer = vm.envAddress("MAINNET_DEPLOYER_ADDRESS");
            multisig = vm.envAddress("MAINNET_MULTISIG_ADDRESS");
            vm.startBroadcast(deployerPrivateKey);
        } else if (block.chainid == 1513 || block.chainid == 1512 || block.chainid == 11155111) {
            deployerPrivateKey = vm.envUint("TESTNET_PRIVATEKEY");
            deployer = vm.envAddress("TESTNET_DEPLOYER_ADDRESS");
            multisig = vm.envAddress("TESTNET_MULTISIG_ADDRESS");
            vm.startBroadcast(deployerPrivateKey);
        } else if (block.chainid == 31337) {
            multisig = address(0x456);
            deployer = address(0x999);
            vm.startPrank(deployer);
        } else {
            revert("Unsupported chain");
        }
    }

    function _endBroadcast() internal {
        if (block.chainid == 31337) {
            vm.stopPrank();
        } else {
            vm.stopBroadcast();
        }
    }
}

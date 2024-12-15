// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import { ILicenseRegistry } from "@storyprotocol/core/interfaces/registries/ILicenseRegistry.sol";
import { DeployHelper } from "../utils/DeployHelper.sol";

contract StoryNFT is DeployHelper {
    address internal immutable CREATE3_DEPLOYER;
    uint256 private constant CREATE3_DEFAULT_SEED = 1234567890;

    // Constructor accepts CREATE3_DEPLOYER address as an argument
    constructor(address deployerAddress) DeployHelper(deployerAddress) {
        CREATE3_DEPLOYER = deployerAddress;
    }

    function run() public {
        create3SaltSeed = CREATE3_DEFAULT_SEED;
        writeDeploys = true;

        _readStoryProtocolCoreAddresses();

        // Fetch default license terms from the LicenseRegistry
        (address defaultLicenseTemplate, uint256 defaultLicenseTermsId) = 
            ILicenseRegistry(licenseRegistryAddr).getDefaultLicenseTerms();

        if (defaultLicenseTemplate == address(0)) {
            revert("Invalid default license template address");
        }

        address orgStoryNftFactorySigner = vm.envAddress("ORG_STORY_NFT_FACTORY_SIGNER");

        // Deploy and configure StoryNFT contracts
        _deployAndConfigStoryNftContracts({
            licenseTemplate_: defaultLicenseTemplate,
            licenseTermsId_: defaultLicenseTermsId,
            orgStoryNftFactorySigner: orgStoryNftFactorySigner,
            isTest: false
        });

        // Write deployment details
        _writeDeployment();
    }
}

# Supported Workflows

- `createCollection`: Creates a NFT Collection

### Final Step: Register an IP Asset

- `registerIp`: Registers an IP
- `mintAndRegisterIp`: Mints a NFT → Registers it as an IP

### Final Step: Attach Programmable IP License (PIL) terms to an IP Asset

- `registerPILTermsAndAttach`: Registers PIL terms → Attaches them to an IP
- `registerIpAndAttachPILTerms`: Registers an IP → Registers PIL terms → Attaches them to the IP
- `mintAndRegisterIpAndAttachPILTerms`: Mints a NFT → Registers it as an IP → Registers PIL terms → Attaches them to the IP.

### Final Step: Register Derivative IP Asset

- `registerIpAndMakeDerivative`: Registers an IP → Registers it as a derivative of another IP
- `mintAndRegisterIpAndMakeDerivative`: Mints a NFT → Registers it as an IP → Registers the IP as a derivative of another IP

- `registerIpAndMakeDerivativeWithLicenseTokens`: Registers an IP → Registers it as a derivative of another IP using the license tokens
- `mintAndRegisterIpAndMakeDerivativeWithLicenseTokens`: Mints a NFT → Registers it as an IP → Registers the IP as a derivative of another IP using the license tokens

### Final Step: Add IP(s) to a group IP Asset

- `mintAndRegisterIpAndAttachLicenseAndAddToGroup`: Mints a NFT → Registers it as an IP → Attaches the given license terms to the IP → Adds the IP to a group IP
- `registerIpAndAttachLicenseAndAddToGroup`: Registers an IP → Attaches the given license terms to the IP → Adds the IP to a group IP
- `registerGroupAndAttachLicenseAndAddIps`: Registers a group IP → Attaches the given license terms to the group IP → Adds existing IPs to the group IP


### Claiming IP Revenue
- `transferToVaultAndSnapshotAndClaimByTokenBatch`:
  - Transfers revenue tokens to ancestor IP’s royalty vault → Takes a snapshot of the royalty vault → Claims all available revenue tokens from the snapshot to the claimer’s wallet
  - *Use Case*: For IP royalty token holders who want to claim both their direct revenue and royalties from descendant IPs.
- `transferToVaultAndSnapshotAndClaimBySnapshotBatch`:
  - Transfers revenue tokens to ancestor IP’s royalty vault → Takes a snapshot of the royalty vault → Claims all available revenue tokens from the new snapshot to the claimer’s wallet → Claims all available revenue tokens from each provided unclaimed snapshot to the claimer’s wallet
  - *Use Case*: For IP royalty token holders who want to claim both direct revenue and descendant royalties from the latest snapshot and previously taken snapshots.
- `snapshotAndClaimByTokenBatch`:
  - Takes a snapshot of the royalty vault → Claims all available revenue tokens from the new snapshot to the claimer’s wallet
  - *Use Case*: For IP royalty token holders who want to claim the current revenue in their IP’s royalty vault (which may or may not include descendant royalties).
- `snapshotAndClaimBySnapshotBatch`:
  - Takes a snapshot of the royalty vault → Claims all available revenue tokens from the new snapshot to the claimer’s wallet → Claims all available revenue tokens from each provided unclaimed snapshot to the claimer’s wallet
  - *Use Case*: For IP royalty token holders who want to claim the current revenue in their IP’s royalty vault from the latest snapshot and previously taken snapshots.


> 📚 For full contract interfaces, check out `contracts/interfaces`.

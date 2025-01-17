// SPDX-License-Identifier: AGPL-3.0

pragma solidity 0.8.9;

import "./02_18_Initializable.sol";
import "./01_18_Ownable.sol";

import "./07_18_Address.sol";
import "./09_18_Counters.sol";
import "./03_18_ReentrancyGuard.sol";
import "./04_18_IERC20.sol";
import "./05_18_IERC721.sol";

import "./13_18_WithdrawExtension.sol";
import "./15_18_ERC721InstantReleaseExtension.sol";
import "./17_18_ERC721ShareSplitExtension.sol";
import "./16_18_ERC721LockableClaimExtension.sol";

contract ERC721ShareInstantStream is
    Initializable,
    Ownable,
    ERC721InstantReleaseExtension,
    ERC721ShareSplitExtension,
    ERC721LockableClaimExtension,
    WithdrawExtension
{
    string public constant name = "ERC721 Share Instant Stream";

    string public constant version = "0.1";

    struct Config {
        // Base
        address ticketToken;
        uint64 lockedUntilTimestamp;
        // Share split extension
        uint256[] tokenIds;
        uint256[] shares;
        // Lockable claim extension
        uint64 claimLockedUntil;
    }

    /* INTERNAL */

    constructor(Config memory config) {
        initialize(config, msg.sender);
    }

    function initialize(Config memory config, address deployer)
        public
        initializer
    {
        _transferOwnership(deployer);

        __WithdrawExtension_init(deployer, WithdrawMode.OWNER);
        __ERC721MultiTokenStream_init(
            config.ticketToken,
            config.lockedUntilTimestamp
        );
        __ERC721InstantReleaseExtension_init();
        __ERC721ShareSplitExtension_init(config.tokenIds, config.shares);
        __ERC721LockableClaimExtension_init(config.claimLockedUntil);
    }

    function _beforeClaim(
        uint256 ticketTokenId_,
        address claimToken_,
        address beneficiary_
    ) internal override(ERC721MultiTokenStream, ERC721LockableClaimExtension) {
        ERC721MultiTokenStream._beforeClaim(
            ticketTokenId_,
            claimToken_,
            beneficiary_
        );
        ERC721LockableClaimExtension._beforeClaim(
            ticketTokenId_,
            claimToken_,
            beneficiary_
        );
    }
}
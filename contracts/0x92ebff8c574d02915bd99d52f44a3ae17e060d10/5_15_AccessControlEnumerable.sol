// SPDX-License-Identifier: MIT
// Copyright (c) 2023 the ethier authors (github.com/divergencetech/ethier)
pragma solidity >=0.8.0 <0.9.0;

import {AccessControlEnumerable as ACE} from "./5_15_AccessControlEnumerable.sol";

contract AccessControlEnumerable is ACE {
    /// @notice The default role intended to perform access-restricted actions.
    /// @dev We are using this instead of DEFAULT_ADMIN_ROLE because the latter
    /// is intended to grant/revoke roles and will be secured differently.
    bytes32 public constant DEFAULT_STEERING_ROLE =
        keccak256("DEFAULT_STEERING_ROLE");

    /// @dev Overrides supportsInterface so that inheriting contracts can
    /// reference this contract instead of OZ's version for further overrides.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ACE)
        returns (bool)
    {
        return ACE.supportsInterface(interfaceId);
    }
}

// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./41_54_Pausable.sol";
import "./15_54_ReentrancyGuard.sol";
import "./16_54_Ownable.sol";

/**
 * @title  BaseLoan
 * @author NFTfi
 * @dev Implements base functionalities common to all Loan types.
 * Mostly related to governance and security.
 */
abstract contract BaseLoan is Ownable, Pausable, ReentrancyGuard {
    /* *********** */
    /* CONSTRUCTOR */
    /* *********** */

    /**
     * @notice Sets the admin of the contract.
     *
     * @param _admin - Initial admin of this contract.
     */
    constructor(address _admin) {
        // solhint-disable-previous-line no-empty-blocks
    }

    /* ********* */
    /* FUNCTIONS */
    /* ********* */

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - Only the owner can call this method.
     * - The contract must not be paused.
     */
    function pause() external onlyOwner {
        _pause();
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - Only the owner can call this method.
     * - The contract must be paused.
     */
    function unpause() external onlyOwner {
        _unpause();
    }
}

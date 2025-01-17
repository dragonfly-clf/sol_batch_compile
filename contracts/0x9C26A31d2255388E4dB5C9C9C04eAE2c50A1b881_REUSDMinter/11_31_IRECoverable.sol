// SPDX-License-Identifier: reup.cash
pragma solidity ^0.8.17;

import "./29_31_CheapSafeERC20.sol";

interface IRECoverable
{
    error NotRECoverableOwner();
    
    function recoverERC20(IERC20 token) external;
    function recoverNative() external;
}
// SPDX-License-Identifier: reup.cash
pragma solidity ^0.8.17;

import "./03_31_IERC20.sol";

interface ICanMint is IERC20
{
    function mint(address to, uint256 amount) external;
}
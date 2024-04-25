// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AirdropContract {
    ERC20 public token;
    address[] public recipients;

    constructor() {}

    function airdrop(
        ERC20 _token,
        address[] memory _recipients,
        uint256 _totalAirdropAmount
    ) external {
        token = _token;
        recipients = _recipients;

        require(_token.balanceOf(msg.sender) >= _totalAirdropAmount, "Insufficient token balance");

        uint256 airdropAmountPerRecipient = _totalAirdropAmount / recipients.length;

        for (uint256 i = 0; i < recipients.length; i++) {
            require(_token.transferFrom(msg.sender, recipients[i], airdropAmountPerRecipient), "Token transfer failed");
        }
    }
}

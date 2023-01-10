// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/tokens/ERC20.sol";
import "solmate/auth/Owned.sol";

contract JustaCoin is ERC20, Owned {
    constructor(uint256 initSupply) ERC20("JustaCoin", "JTC", 18) Owned(msg.sender) {
        _mint(msg.sender, initSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }
}

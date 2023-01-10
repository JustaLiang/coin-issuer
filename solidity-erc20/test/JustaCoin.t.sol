// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/JustaCoin.sol";

contract JustaCoinTest is Test {
    JustaCoin internal jtc;
    address internal issuer;
    address internal alice;
    uint256 internal constant INIT_SUPPLY = 1_000_000 ether;

    function setUp() public {
        issuer = makeAddr("issuer");
        alice = makeAddr("alice");
        hoax(issuer);
        jtc = new JustaCoin(INIT_SUPPLY);
    }

    function testInitialBalance() public {
        assertEq(jtc.balanceOf(issuer), INIT_SUPPLY);
    }

    function testTransfer(uint256 transferAmount) public {
        vm.assume(transferAmount <= INIT_SUPPLY);
        hoax(issuer);
        jtc.transfer(alice, transferAmount);
        assertEq(jtc.balanceOf(issuer), INIT_SUPPLY - transferAmount);
        assertEq(jtc.balanceOf(alice), transferAmount);
    }

    function testMint(uint128 mintAmount) public {
        hoax(issuer);
        jtc.mint(alice, mintAmount);
        assertEq(jtc.balanceOf(alice), mintAmount);
        assertEq(jtc.totalSupply(), INIT_SUPPLY + mintAmount);
    }

    function testBurn(uint256 burnAmount) public {
        vm.assume(burnAmount <= INIT_SUPPLY);
        hoax(issuer);
        jtc.burn(burnAmount);
        assertEq(jtc.balanceOf(issuer), INIT_SUPPLY - burnAmount);
        assertEq(jtc.totalSupply(), INIT_SUPPLY - burnAmount);
    }

    function testFailNotOwnerMint() public {
        hoax(alice);
        jtc.mint(alice, 1_000 ether);
    }
}

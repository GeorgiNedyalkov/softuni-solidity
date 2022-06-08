// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./safemath.sol";
import "./owned.sol";

contract Voting is Owned {
    using SafeMath for uint256;

    address public owner;

    struct Voter {
        address voterAddres;
        uint256 donatedEth;
        uint256 timeLastDonation;
        uint256 lastDonationAmount;
    }

    Voter[] public members;

    constructor() public {
        owner = msg.sender;
        members.push(owner);
    }

    function kill() public onlyOwner {
        selfdestruct(payable(address(this)));
    }

    function addMember()
}
 
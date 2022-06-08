// SPFX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address payable public owner; // owner is payable so that it can be self destructed

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
}

contract Destructible is Ownable {
    constructor() public payable {}

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function destroyAndSend(address payable _recipient) public onlyOwner {
        selfdestruct(_recipient);
    }
}

pragma solidity >=0.4.22 <0.5.5;

contract ContractOwnership {
    address owner;

    event OwnershipChanged(address oldOwner, address newOwner);
    event FallbackEvent(address sender, uint256 value);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        newOwner = owner;
        emit OwnershipChanged(owner, newOwner);
    }

    function acceptOwnership() public onlyOwner {
        uint256 timeLimit = block.timestamp + 30 seconds;
        require(block.timestamp < timeLimit);
    }

    function() external payable {
        emit FallbackEvent(msg.sender, msg.value);
    }
}

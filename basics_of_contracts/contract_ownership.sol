pragma solidity >=0.4.22 <0.5.5;

contract ContractOwnership {
    event OwnershipChanged(address indexed oldOwner, address indexed newOwner);
    event FallbackEvent(address sender, uint256 value);

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only the owner can execute the function");
        _;
    }

    modifier onlyProposedOwner() {}

    function changeOwner(address newOwner) public onlyOwner {
        address oldOwner = owner;
        newOwner = owner;
        emit OwnershipChanged(oldOwner, newOwner);
    }

    function acceptOwnership() public onlyOwner {
        require(msg.sender == newOwner);
        uint256 timeLimit = block.timestamp + 30 seconds;
        require(block.timestamp < timeLimit);
    }

    function() external payable {
        emit FallbackEvent(msg.sender, msg.value);
    }
}

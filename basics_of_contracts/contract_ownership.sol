pragma solidity >=0.4.22 <0.6.0;

contract ContractOwnership {
    event FallbackEvent(address sender, uint256 value);
    event OwnershipChanged(address indexed oldOwner, address indexed newOwner);

    address public owner;
    address public prospectOwner;
    uint256 public ownershipChangedTimeStamp;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only the owner can execute the function");
        _;
    }

    modifier onlyProposedOwner() {
        require(msg.sender == prospectOwner);
        _;
    }
    modifier inTimeframe() {
        require((ownershipChangedTimeStamp + 30 seconds) < block.timestamp);
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        newOwner = owner;
        ownershipChangedTimeStamp = block.timestamp;
        emit OwnershipChanged(owner, newOwner);
    }

    function acceptOwnership() public onlyProposedOwner inTimeframe {
        owner = prospectOwner;
    }

    function() external payable {
        emit FallbackEvent(msg.sender, msg.value);
    }
}

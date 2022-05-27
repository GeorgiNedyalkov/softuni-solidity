pragma solidity >=0.4.22 <0.6.0;

contract ServiceMarketplace {
    event LogServiceBought(address indexed by, uint256 timestamp);

    address payable owner;
    uint256 lastBuy = 0;
    uint256 lastWithdraw = 0;

    function() external payable {
        revert("Use buy function");
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier serviceLock() {
        require(block.timestamp > lastBuy + 2 minutes);
        _;
    }

    modifier withdrawLock() {
        require(block.timestamp > lastWithdraw + 1 hours);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function buy() public payable serviceLock {
        require(msg.value >= 1 ether);
        lastBuy = block.timestamp;
        emit LogServiceBought(msg.sender, lastBuy);

        uint256 remainingAmount = msg.value - 1 ether;

        if (remainingAmount > 0) {
            msg.sender.transfer(remainingAmount);
        }
    }

    function withdraw(uint256 withdrawAmount) public onlyOwner withdrawLock {
        require(withdrawAmount <= 5 ether);
        // the address(this).balance is the balance of the current contract
        // is the balance of the contract bigger than the amount to withdraw
        // We are type casting this as an address
        require(address(this).balance >= withdrawAmount);

        lastWithdraw = block.timestamp;
        owner.transfer(withdrawAmount);
    }
}

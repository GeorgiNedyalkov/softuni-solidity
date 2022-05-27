pragma solidity >=0.4.22 <0.6.0;

contract ServiceMarketplace {
    address public onwer;
    address cashRegister;
    uint256 servicePrice;

    uint256 lastWidrawalTimestamp;
    uint256 lastPurchaseTimestamp;

    event LogServiceBought(address indexed buyer, uint256 payment);

    modifier onlyOnwer() {
        require(onwer = msg.sender, "Only the owner can call this function");
        _;
    }

    modifier marketIsOpen() {
        require(lastPurchaseTimestamp > block.timestamp + 2 minutes);
        _;
    }

    constructor() public {
        onwer = msg.sender;

        servicePrice = 1 ether;
    }

    function buyService() public payable marketIsOpen {
        require(msg.value > 0);

        if (msg.value > servicePrice) {
            uint256 remainingAmount = msg.value - servicePrice;
            cashRegister.transfer(servicePrice);
            msg.sender.transfer(remainingAmount);
        } else {
            cashRegister.transfer(servicePrice);
        }

        lastPurchaseTimestamp = block.timestamp;

        emit LogServiceBought(msg.sender, msg.value);
    }

    function withdraw(uint256 withdrawAmount) onlyOwner {
        require(
            withdrawAmount <= 5 ether,
            "Maximum withdraw amount is 5 ethers"
        );
        require(lastWidrawTimestamp > block.timestamp + 1 hours);

        cashRegister -= withdrawAmount;
        msg.sender.transfer(withdrawAmount);
        lastWidrawalTimestamp = block.timestamp;
    }
}

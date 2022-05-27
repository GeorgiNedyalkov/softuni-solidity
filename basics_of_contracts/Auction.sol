pragma solidity >=0.4.22 <0.6.0;

contract Auction {
    address public owner;
    uint256 startBlock;
    uint256 endBlock;

    bool public canceled;
    address public highestBidder;
    mapping(address => uint256) fundsOfBidder;
    uint256 margin;
    mapping(address => uint256) timeLimit;

    event LogBid(
        address bidder,
        uint256 bid,
        address highestBidder,
        uint256 highestBid
    );
    event LogWithdrawal(
        address withdrawer,
        address withdrawalAccount,
        uint256 amount
    );
    event LogCanceled();

    constructor(
        uint256 _startBlock,
        uint256 _endBlock,
        uint256 _margin
    ) public {
        require(_startBlock <= _endBlock);
        require(_startBlock > block.number);

        owner = msg.sender;
        startBlock = _startBlock;
        endBlock = _endBlock;

        margin = _margin;
    }

    modifier auctionIsLive() {
        require(canceled == false);
        require(block.number >= startBlock && block.number <= endBlock);
        _;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier onlyNotOwner() {
        require(owner != msg.sender);
        _;
    }

    modifier onlyAfterStart() {
        require(block.number >= startBlock);
        _;
    }

    modifier onlyBeforeEnd() {
        require(block.number <= endBlock);
        _;
    }

    modifier onlyNotCanceled() {
        require(canceled == false);
        _;
    }

    modifier onlyEndedOrCanceled() {
        require(canceled == false);
        _;
    }

    function placeBid()
        public
        payable
        auctionIsLive
        onlyAfterStart
        onlyBeforeEnd
        onlyNotCanceled
        onlyNotOwner
    {
        // reject payments of 0 ETH
        require(msg.value > 0);
        require(timeLimit[msg.sender] < (block.timestamp + 1 hours));

        uint256 newBid = fundsOfBidder[msg.sender] + msg.value; // add to your bid, rather than making a new bid

        // get the current highest bid
        uint256 highestBid = fundsOfBidder[highestBidder];

        require(newBid > highestBid + margin);

        // update the user bid
        fundsOfBidder[msg.sender] = newBid;

        highestBidder = msg.sender;

        timeLimit[msg.sender] = block.timestamp;

        emit LogBid(msg.sender, newBid, highestBidder, highestBid);
    }

    // it is always a good principle to let users withdraw funds themselves rather than sending it to them
    function withdraw() public onlyEndedOrCanceled {
        address withdrawAccount = msg.sender;
        uint256 withdrawAmount;

        if (canceled) {
            withdrawAmount = fundsOfBidder[msg.sender];
        } else {
            // highest bidder won so he cannot withdraw his funds
            require(msg.sender != highestBidder);

            // the auction's owner should be allowed to withdraw the highest bid
            if (msg.sender == owner) {
                withdrawAmount = fundsOfBidder[highestBidder];
                withdrawAccount = highestBidder;
            } else {
                // all the participants should be able to withdraw of they did not win
                withdrawAmount = fundsOfBidder[msg.sender];
            }
        }

        require(withdrawAmount > 0);

        // first decrearse the balance if the withdrawer (protection against Reentrancy)
        fundsOfBidder[withdrawAccount] -= withdrawAmount;

        // then send the funds
        msg.sender.transfer(withdrawAmount);

        emit LogWithdrawal(msg.sender, withdrawAccount, withdrawAmount);
    }

    function cancelAuction() public onlyOwner onlyBeforeEnd onlyNotCanceled {
        canceled = true;
        emit LogCanceled();
    }
}

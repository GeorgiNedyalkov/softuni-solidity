pragma solidity >=0.4.22 <0.6.0;

contract Auction {
    address public owner;
    uint256 startAuction;
    uint256 endAuction;

    address public highestBidder;
    uint256 public highestBid;
    bool public canceled;
    mapping(address => uint256) placedBids;

    event NewHighestBid(uint256 previousHighestBid, uint256 NewHighestBid);
    event ReturnedHighestBid(uint256 highestBid, address highestBidder);
    event AuctionEnded(address winner, uint256 winningBid);

    constructor(uint256 auctionDuration) public {
        owner = msg.sender;
        auctionLive = true;
        startAuction = block.timestamp;
        endAuction = block.timestamp + auctionDuration;
    }

    modifier notOwner() {
        require(owner != msg.sender, "Action owner cannot place bid.");
        _;
    }

    modifier liveAuction() {
        assert(auctionLive == true);
        assert(startAuction < block.timestamp && endAuction > block.timestamp);
        _;
    }

    function placeBid(uint256 bid) public payable notOwner liveAuction {
        require(bid > highestBid);
        placedBid[msg.sender] = bid;
        highestBid = bid;
        highestBidder = msg.sender;
        emit NewHighestBid(bid, highestBid);
    }

    function getHighestBid() public view returns (uint256, address) {
        return (highestBid, highestBidder);
        emit ReturnedHighestBid(highestBid, highestBidder);
    }

    function cancelAuction() public onlyOwner {
        auctionLive = false;
    }

    function withdrawFunds() public payable {
        require(auctionLive == false);
        msg.sender.transfer(placedBids[msg.sender]);
    }
}

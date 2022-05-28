pragma solidity >=0.4.22 <0.6.0;

contract Agreement {
    address[] public owners;

    uint256 nextToVote = 0;

    struct Proposal {
        address payable beneficiary;
        uint256 funds;
        uint256 timestamp;
    }

    Proposal public proposal;

    modifier canPropose() {
        for (uint256 index = 0; index < owners.length; index++) {
            if (owners[index] == msg.sender) {
                _;
                break;
            }
        }
    }

    constructor(address[] memory _owners) public {
        owners = _owners;
    }

    function() external payable {}

    function propose(address payable beneficiary, uint256 value)
        public
        canPropose
    {
        require(block.timestamp > proposal.timestamp + 5 minutes);
        proposal = Proposal(beneficiary, value, block.timestamp);
        nextToVote = 0;
    }

    function vote() public {
        require(nextToVote < owners.length);
        require(owners[nextToVote] == msg.sender);
        require(block.timestamp <= proposal.timestamp + 5 minutes);
        require(address(this).balance >= proposal.funds);

        nextToVote++;

        if (nextToVote >= owners.length) {
            proposal.beneficiary.transfer(proposal.funds);
        }
    }
}

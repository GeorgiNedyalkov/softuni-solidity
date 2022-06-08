// SPFX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./safemath.sol";

library Members {
    using SafeMath for uint256;

    struct Member {
        address voterAddress;
        uint256 totalValue;
        uint256 lastDonation;
        uint256 lastValue;
    }

    function memberHasTimedOut(Member storage self) public view returns (bool) {
        if (self.lastDonation + 1 hours < now) {
            return true;
        }

        return false;
    }

    function remove(Member storage self) public {
        if (memberHasTimedOut(self)) {
            self.voterAddress = address(0);
        }
    }

    function initialize(Member storage self, address addr) public {
        self.voterAddres = addr;
        self.lastDonation = now;
    }

    function update(Member storage self, uint256 donatedValue) public {
        self.lastValue = donatedValue;
        self.lastDonation = now;
        self.totalValue = self.totalValue.add(donatedValue);
    }
}

contract MemberVoter is Ownable, Destructible {
    using SafeMath for uint256;
    using Members for Members.Member;

    event LogMemberAdded(address indexed adr);
    event LogMemberRemoved(address indexed adr);
    event LogVotingStarted(bytes32 indexed id);
    event LogVotingEnded(bytes32 indexed id, bool successful);
    event LogDonation(address indexed from, uint256 value);

    mapping(address => Members.Member) public members;

    uint256 public memberCount;

    struct Voting {
        address proposedMember;
        uint256 votesFor;
        uint256 votesAgainst;
        mapping(address => bool) voted;
    }

    mapping(bytes32 => Voting) public votings; // the key is the hash of the proposed member and current timestamp

    // ! no member can be removed when there is an active voting
    uint256 public activeVotings;

    modifier canRemoveMember(address adr) {
        require(adr != owner); // the owner cannot be removed
        require(activeVotings == 0); // no member can be removed during active votings
        require(members[adr].adr != address(0)); // member should exists
        _;
    }

    modifier canAddMember(address adr) {
        require(adr != address(0));
        require(members[adr].adr == address(0));
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender].adr != address(0));

        if (!tryRemovingMember(msg.sender)) {
            _;
        }
    }

    modifier hasValue() {
        require(msg.value > 0);
        _;
    }

    constructor() public {
        _addMember(owner); // initialize the owner as the first member
    }

    function _addMember(address adr) private canAddMember(adr) {
        assert(members[adr].adr == address(0));

        members[adr].initialize(adr);
        memberCount = memberCount.add(1);

        emit LogMemberAdded(adr);
    }

    function _removeMember(address adr) private canRemoveMember(adr) {
        assert(members[adr].adr != address(0));

        members[adr].remove();
        memberCount = memberCount.sub(1);

        emit LogMemberRemoved(adr);
    }

    function removeMember(address adr) public canRemoveMember(adr) onlyOwner {
        _removeMember(adr);
    }

    function tryRemovingMember(address adr) public returns (bool) {
        if (members[adr].memberHasTimedOut()) {
            if (activeVotings == 0) {
                _removeMember(adr);
                return true;
            }
        }

        return false;
    }

    function donate() public payable onlyMember hasValue {
        members[msg.sender].update(msg.value);

        emit LogDonation(msg.sender, msg.value);
    }

    function _addVoting(address proposedMember)
        private
        canAddMember(proposedMember)
        returns (bytes32)
    {
        bytes32 id = keccak256(abi.encodePacked(proposedMember, now));

        votings[id] = Voting({
            proposedMember: proposedMember,
            votesFor: 0,
            votesAgainst: 0
        });

        activeVotings = activeVotings.add(1);

        emit LogVotingStarted(id);

        return id;
    }

    function _removeVoting(bytes32 id) private {
        votings[id].proposedMember = address(0);
        activeVotings = activeVotings.sub(1);
    }

    function proposeMember(address proposedMember)
        public
        onlyMember
        canAddMember(proposedMember)
        returns (bytes32)
    {
        require(!members[msg.sender].memberHasTimedOut());

        return _addVoting(proposedMember);
    }

    function vote(bytes32 id, bool voteFor) public onlyMember {
        require(votings[id].proposedMember != address(0));
        require(!votings[id], voted[msg.sender]);

        votings[id].voted[msg.sender] = true;

        if (voteFor) {
            votings[id].votesFor = votings[id].votesFor.add(1);
        } else {
            votings[id].votesAgainst = votings[id].votesAgainst.add(1);
        }

        if (votings[id].votesFor >= memberCount.div(2)) {
            _addMember((votings[id].proposedMember));
            _removeVoting(id);

            emit LogVotingEnded(id, true);
        } else if (votings[id].votesAgainst >= memberCount.div(2)) {
            _removeVoting(id);

            emit LogVotingEnded(id, false);
        }
    }
}

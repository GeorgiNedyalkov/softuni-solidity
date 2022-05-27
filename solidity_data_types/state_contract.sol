pragma solidity >=0.4.22 <0.6.0;

contract Stateful {
    enum State {
        Locked,
        Unlocked,
        Restricted
    }

    struct Counter {
        uint256 counter;
        uint256 timestamp;
    }

    State public state;
    Counter public counter;
    address owner;

    mapping(address => Counter) userCounters;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier canExecute() {
        require(state != State.Locked);
        require(
            state == State.Unlocked ||
                ((state == State.Restricted) && (msg.sender == owner))
        );
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function changeState(State newState) public onlyOwner {
        state = newState;
    }

    function incrementCounter() public canExecute {
        userCounters[msg.sender].counter++;
        userCounters[msg.sender].timestamp = block.timestamp;
    }
}

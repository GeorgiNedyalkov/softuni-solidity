pragma solidity >=0.4.22 <0.6.0;

contract SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
}

contract Owned {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

contract Inheritant is SafeMath, Owned {
    uint256 state;
    uint256 lastChange = now;

    function changeState() public onlyOwner {
        state = add(state, (now % 256));
        state = mul(state, sub(now, lastChange));
        state = sub(state, block.gaslimit);
        lastChange = now;
    }

    function getState() public view returns (int256) {
        return state;
    }
}

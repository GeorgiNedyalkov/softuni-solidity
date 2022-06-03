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
    }
}

contract Owned {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

contract Inheritant is SafeMath, Owned {
    int256 state;
    uint256 stateChangeTimestamp = 1;

    function changeState() public onlyOwner {
        add(uint256(state), (now % 256));
        mul(uint256(state), stateChangeTimestamp);
        stateChangeTimestamp = now;
        sub(uint256(state), block.gaslimit);
    }

    function getState() public view returns (int256) {
        return state;
    }
}

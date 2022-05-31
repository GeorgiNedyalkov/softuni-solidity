pragma solidity >=0.4.22 <0.6.0;

contract Token {
    string public tokenName = "G Coin";
    string public symbol = "G";
    uint8 decimals = 18;
    uint256 totalSupply;

    mapping(address => Token) balances;

    constructor(uint256 _tokeSupply) public {
        balances[msg.sender] = _totalSupply * 10**decimals;
    }

    function() external {
        assert(false);
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return true;
    }
}

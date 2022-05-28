pragma solidity >=0.4.22 <0.6.0;

contract MultipleCoinsV2 {
    mapping(address => mapping(uint256 => uint256)) public balances;

    constructor() public {
        balances[msg.sender][0] = 10000;
        balances[msg.sender][1] = 10000;
        balances[msg.sender][2] = 10000;
    }

    function sendCoins(
        uint256 _coinIndex,
        address _to,
        uint256 _amount
    ) public {
        require(balances[msg.sender][_coinIndex] >= amount);

        balances[msg.sender][_coinIndex] -= amount;

        balances[_to][_coinIndex] += amount;
    }
}

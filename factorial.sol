pragma solidity ^0.6.0;

contract Factorial {
    function calcFactorial(uint256 n) public returns (uint256) {
        n = (n * calcFactorial(n - 1));
        return n;
    }
}

pragma solidity ^0.6.0;

contract Factorial {
    function calcFactorialIterative(uint256 n) public returns (uint256) {
        uint256 result = 1;

        for (uint256 i = n; i > 0; i--) {
            result *= i;
        }

        return result;
    }

    function calcFactorialRecursive(uint256 n) public returns (uint256) {
        uint256 result = 1;
        uint256 counter = n;

        if (counter == 0) {
            return result;
        } else {
            return counter *= calcFactorialRecursive(--n);
        }
    }
}

// SPFX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c > a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(a > b);
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / b == a);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        if (b == 0) return 0;
        return (a / b);
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        if (b == 0) return 0;
        return a % b;
    }
}

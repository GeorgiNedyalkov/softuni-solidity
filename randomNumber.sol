pragma solidity ^0.6.0;

contract RandomNumberGenerator {
    function generateRandomNumber(uint256 salt) public view returns (uint256) {
        uint256 random;

        random = uint256(keccak256(abi.encodePacked(salt, now)));
    }

    function generateRandomNumber() public view returns (uint256) {
        uint256 nonce = 0;
        uint256 randomNumber = uint256(
            keccak256(
                abi.encodePacked(
                    msg.sender,
                    block.number,
                    nonce,
                    block.timestamp,
                    block.coinbase
                )
            )
        );
        nonce++;
        return randomNumber;
    }
}

pragma solidity >=0.4.22 <0.6.0;

contract ArrayExample {
    // automatic index getter
    uint256[3] public threeInts = [1, 2, 3];

    // automatic index getter
    uint256[] public manyInts;

    function increment(uint8 index) public {
        threeInts[index] += 1;
    }

    function push(uint256 newInt) public {
        manyInts.push(newInt);
        // same as:
        manyInts.length += 1;
        manyInts[manyInts.length - 1] = newInt;
    }

    function getManyInts() public view returns (uint256[] memory) {
        return manyInts;
    }

    function getThreeInts() public view returns (uint256[3] memory) {
        return threeInts;
    }
}

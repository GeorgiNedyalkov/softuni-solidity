pragma solidity >=0.4.22 <0.6.0;

contract CrowdSale {
    mapping(address => uint256) balances;
    mapping(address => bool) hadBalance;

    address[] public tokenOwners;

    uint256 start = now;
    address payable owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier crowdSalePeriod() {
        require(now < start + 5 minutes);
        _;
    }

    modifier withdrawAllowed() {
        require(now > start + 365 days);
        _;
    }

    constructor() public {
        owner == msg.sender;
    }

    function buy() public payable crowdSalePeriod {
        require(msg.value / 1 ether > 0); // at least 1 ether
        require((msg.value / 1 ether) * 1 ether == msg.value); // accept only 1 ETH

        uint256 tokens = (msg.value / 1 ether) * 5; // the token rate

        // the default balance for everybody is 0;
        balances[msg.sender] += tokens;

        updateTokenOwners();
    }

    function updateTokenOwners() internal {
        if (!hadBalance[msg.sender]) {
            tokenOwners.push(msg.sender);
            hadBalance[msg.sender] = true;
        }
    }

    function withdraw() public onlyOwner withdrawAllowed {
        owner.transfer(address(this).balance); // for the owner to be able to withdraw the balance it muse be payable
    }

    function transfer(uint256 tokens, address to) public {
        require(balances[msg.sender] >= tokens);

        balances[msg.sender] -= tokens;
        balances[to] += tokens;

        updateTokenOwners();
    }

    function getTokenOwners() public view returns (address[] memory) {
        return tokenOwners;
    }
}

pragma solidity >=0.4.22 <0.6.0;

contract Agent {
    address master;
    uint256 lastOrder;

    modifier onlyMaster() {
        require(master == msg.sender);
        _;
    }

    modifier canReceiveOrder() {
        require(isReady());
        _;
    }

    constructor(address _master) public {
        master = _master;
    }

    function receiveOrder() public onlyMaster canReceiveOrder {
        lastOrder = now;
    }

    function isReady() public view returns (bool) {
        return now > lastOrder + 15 seconds;
    }
}

contract Master {
    address public onwer;

    mapping(address => bool) approvedAgents;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier agentExists(Agent agent) {
        require(approvedAgents[address(agent)]);
        _;
    }

    constructor() public {
        onwer = msg.sender;
    }

    function newAgent() public onlyOwner returns (Agent) {
        Agent agent = new Agent(address(this));

        approvedAgents[address(agent)] = true;

        return agent;
    }

    function addAgent(Agent agent) public onlyOwner {
        approvedAgents[address(agent)] = true;
    }

    function giveOrder(Agent agent) public onlyOwner agentExists(agent) {
        agent.receiveOrder();
    }

    function queryOrder(Agent agent)
        public
        view
        agentExists(agent)
        returns (bool)
    {
        return agent.isReady();
    }
}

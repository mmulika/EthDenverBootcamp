pragma solidity ^0.8.0;

contract CrowdFunding {
    address public creator;
    uint256 public goal;
    uint256 public amountRaised;
    uint256 public deadline;
    mapping(address => uint256) public backers;
    bool public goalReached;

    constructor(uint256 _goal, uint256 _deadline) public {
        creator = msg.sender;
        goal = _goal;
        deadline = _deadline;
    }

    function contribute() public payable {
        require(msg.value > 0, "Contribution must be positive");
        require(!goalReached, "Goal has already been reached");
        require(now <= deadline, "Deadline has passed");
        backers[msg.sender] += msg.value;
        amountRaised += msg.value;
        if (amountRaised >= goal) {
            goalReached = true;
        }
    }

    function refund() public {
        require(goalReached == false, "Goal has been reached, no refunds");
        uint256 refundAmount = backers[msg.sender];
        backers[msg.sender] = 0;
        amountRaised -= refundAmount;
        msg.sender.transfer(refundAmount);
    }

    function payOut() public {
        require(goalReached, "Goal has not been reached, cannot pay out");
        require(msg.sender == creator, "Only the creator can pay out");
        creator.transfer(amountRaised);
    }
}

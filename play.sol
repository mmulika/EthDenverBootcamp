pragma solidity ^0.8.0;

contract EarnAsYouPlay {
    mapping(address => uint256) public points;
    uint256 public reward;

    function earnPoints(uint256 earnedPoints) public {
        points[msg.sender] += earnedPoints;
    }

    function redeemPoints() public {
        require(points[msg.sender] >= reward, "You do not have enough points to redeem a reward");
        msg.sender.transfer(reward);
        points[msg.sender] -= reward;
    }

    struct user{
        uint256 id,
        string name,
        uint256 amount
        

}

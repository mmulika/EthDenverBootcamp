pragma solidity ^0.8.0;

contract Betting {
    address public owner;
    uint public betAmount;
    uint public payoutAmount;
    uint public outcome;

    event BetPlaced(address indexed player, uint amount);
    event BetOutcome(uint outcome);

    constructor() {
        owner = msg.sender;
        betAmount = 0.1 ether;
        payoutAmount = 0.2 ether;
    }

    function placeBet(uint _outcome) public payable {
        require(msg.value == betAmount, "Incorrect bet amount");
        outcome = _outcome;
        emit BetPlaced(msg.sender, msg.value);
    }

    function setOutcome(uint _outcome) public {
        require(msg.sender == owner, "Only the owner can set the outcome");
        outcome = _outcome;
        emit BetOutcome(outcome);
    }

    function distributeWinnings(address payable[] memory players) public {
        require(msg.sender == owner, "Only the owner can distribute winnings");
        for (uint i = 0; i < players.length; i++) {
            if (outcome == i) {
                players[i].transfer(payoutAmount);
            }
        }
    }
}

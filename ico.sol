pragma solidity ^0.8.0;

contract Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint256 public decimals;
    mapping(address => uint256) public balanceOf;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply, uint256 _decimals) public {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        decimals = _decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}

contract ICO {
    Token public token;
    uint256 public rate;
    uint256 public goal;
    uint256 public deadline;
    uint256 public amountRaised;
    mapping(address => uint256) public investors;

    constructor(Token _token, uint256 _rate, uint256 _goal, uint256 _deadline) public {
        token = _token;
        rate = _rate;
        goal = _goal;
        deadline = _deadline;
    }

    function contribute() public payable {
        require(msg.value > 0, "Contribution must be positive");
        require(now <= deadline, "Deadline has passed");
        uint256 tokens = msg.value.mul(rate);
        require(token.balanceOf[address(this)] >= tokens, "Token contract does not have enough tokens");
        investors[msg.sender] += tokens;
        token.transfer(msg.sender, tokens);
        amountRaised += msg.value;
    }
}

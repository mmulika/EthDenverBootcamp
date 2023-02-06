pragma solidity ^0.8.0;

contract ListenToEarn {
    // Define the token symbol and name
    string public symbol = "LTE";
    string public name = "Listen To Earn Token";

    // Mapping of addresses to their token balances
    mapping (address => uint256) public balances;

    // Event to track token transfers
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    // Function to award tokens to a user
    function award(address _to, uint256 _value) public {
        // Ensure the caller has the necessary authorization to award tokens
        require(msg.sender == address(this), "Unauthorized caller");

        // Update the recipient's token balance and trigger the Transfer event
        balances[_to] += _value;
        emit Transfer(address(0), _to, _value);
    }

    // Function to retrieve the balance of a user
    function balanceOf(address _user) public view returns (uint256) {
        return balances[_user];
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract CarbonCreditToken{


    address owner;
    uint totalSupply = 1000;
    uint supply;
    event  added(uint);
    event SetSupply(uint);
    mapping( address => uint) _follow;

    struct Team{

        address  account;
        uint ID;
    }

struct Army{
    string name;
    uint  IDs
}


struct kenya{
    uint ID;
    uint pin;
    string name;
}


struct salary{
    uint amount;
    string job;
    uint  net;
}

mapping (uint -> salary) ear/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details
/// @return Documents the return variables of a contract’s function state variable
/// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
mapping  (uint -> kenya) balance

struct Email{
    uint balance;
    string name;
}
 mapping ( uint  => Email)

   modifier ownerOnly{
       if(msg.sender == owner){
           _;
       }
       
   }

constructor(){
    msg.sender == owner;
}

    function getSupply() public view  returns (uint){
        return totalSupply;
    }
    function add( uint a, uint b) public {
        uint sum;
        sum = a + b;
        emit added(sum);
        
    }

    function setSupply(uint  _supply) public ownerOnly{
    
        supply = _supply ;
        emit SetSupply(_supply);
        
    }

    function get_Supply()  public view returns(uint){
        return supply;
    }
}
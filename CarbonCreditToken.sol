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
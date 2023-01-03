// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract CarbonCreditToken{


    address owner;
    uint totalSupply = 1000;
    uint supply;



    function getSupply() public view  returns (uint){
        return totalSupply;
    }
    function add( uint a, uint b) public{
        uint sum;
        sum = a + b;
        
    }

    function setSupply( uint  _supply) public {
    
        supply = _supply ;
        
    }

    function get_Supply()  public view returns(uint){
        return supply;
    }
}
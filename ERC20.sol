// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


import { ERC20 } from "solmate/tokens/ERC20.sol";


constract ERC20  is ERC20,payable,transfarable{
    
 address public royaltyAddress;
 uint256 public royaltyAmount;

  function modifier(){
    if(msg.sender == owner){
        _;
    }
  }

 constructor (){
msg.sender = owner};

mapping (address => uint256)  balances 

 }


 



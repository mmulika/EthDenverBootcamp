// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract VolcanoCoin{

   address owner;
   uint256 totalsupply = 10000;
   event changeSupply (uint256);


    //constructor 
    constructor(){
        owner = msg.sender;
    }

    //mapping

    mapping(uuit => address) payment

    //
    event createRecond


   //modifier

   modifier onlyowner(){
       if(owner == msg.sender){
           _;
       }
   }


    function getSupply()public  view returns (uint256){
        return totalsupply;
    }

    function setSupply(uint256 _totalsupply)public onlyowner {
        uint256 total;
        total = totalsupply + _totalsupply;
        totalsupply = total;
        emit changeSupply(totalsupply);
    }

    function paymentReconds(uint256 addpeople) public view returns{

        payment = msg.sender
       paymentrecont (payment(receiver address))

       emit event recond ("paymentReconds update)
    

    }

}




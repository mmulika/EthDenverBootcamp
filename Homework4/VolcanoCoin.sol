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
}



// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract FlouraToken{
    uint256 newtoken;
    address owner;
    event _showSupply();

    //constructor
  constructor(){
      owner = msg.sender;
  }

///modifier
 modifier onlyowner(){
     if( owner == msg.sender){
         _;
     }

 }
  struct People{
      uint256 name;
      uint256 game;
  }

People[] public people;
    function setSupply(uint256 _newtoken) public  onlyowner{
        newtoken = _newtoken ;
        emit _showSupply();
    }

    function getSupply()public view returns (uint256){
        return newtoken;
    }

    function addpeople(uint256   _name,uint256 _game) public{
       people.push(People({name:_name,game:_game}));
       newWay [_name] = _game;
    }
    function getpeople()public view returns(uint256){
       
    }

    mapping(uint256 => uint256) public newWay;
}
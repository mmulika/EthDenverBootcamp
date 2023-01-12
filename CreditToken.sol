// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

pragma experimental ABIEncoderV2;

import './CarbonCredit.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract CreditToken is  CarbonCredit,ERC20{
    uint totalsupply;
    uint supply = 1000000;
    uint tokenBurnedCount = 0;
    uint private _decimals;


    constructor() ERC20 ("OkoaNature","OKA") {
        _mint(msg.sender, totalsupply);
    

    }

    mapping(address => uint)  public BalancesOf;
    mapping(address => uint)  public approvedCredits;
    mapping(address => uint) public  totalApprovedForBurn;
    
    modifier onlyVerifier() { 
        require(msg.sender == verifiers[verifiercount].addr);
        _;
    }

    modifier onlyCreditHolder(){
        require(msg.sender == CreditHolders[totalRegistered]._add);
        _;
    }

    function approvedCreditHolder(address _holder)public{
        uint cred = CreditHolders[totalRegistered].creditsHeld;
        approvedCredits[_holder]+= cred;
    }

    function createCarbonToken()public onlyCreditHolder()returns(uint){
        address Owner = CreditHolders[totalRegistered]._add;
        
        supply = approvedCredits[Owner];
        totalsupply = totalsupply + (supply);
        BalancesOf[Owner] = BalancesOf[Owner] + (supply);
        _mint(msg.sender, supply);
        return totalsupply;
    }

    function transferCredits(address to, uint  value) public  onlyCreditHolder(){
        {
            _transfer(msg.sender, to, value);
            BalancesOf[msg.sender] =BalancesOf[msg.sender]- (value);
            BalancesOf[to] = BalancesOf[to] + (value);
        }
    }

    function transferCreditsFrom( address from, address to, uint value) public{
        transferFrom(from, to, value);
        BalancesOf[from] = BalancesOf[from] - (value);
        BalancesOf[to] = BalancesOf[to] + (value);

    }

    function approveBurn(uint carbonTokens,address holder)public  onlyVerifier() {
       {
            totalApprovedForBurn[holder]+=carbonTokens;

        }

// function  burnTokens() public onlyOwner() returns(bool){
//     _burn(msg.sender,tokensApprovedForBurn[msg.sender]);
//     totalsupply =  totalsupply.sub(tokensApprovedForBurn[msg.sender]);
//     BalanceOf[msg.sender] = BalanceOf[msg.sender].sub(tokensApprovedForBurn[msg.sender]);
//         return true;
// }

    //   function buyCarbonCredits(uint amount) public payable {
    //     uint value = amount * 1;
    //     require(msg.value > 0);
    //     transferCreditsFrom(address(this),msg.sender, value);
    //     }

    // }
    
}

}
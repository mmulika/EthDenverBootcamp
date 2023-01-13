// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';


contract CarbonCredit  is Ownable{

    uint  totalRegistered = 0;
    uint verifiercount = 0;
    uint customercount = 0;


//struct object to represent CreditHolder such an  RRD+ eg masai mara
    struct CarbonCreditHolder{
        string name;
        uint id;
        uint holderId;
        uint creditsHeld;
        uint pricepercredit;
        uint creditvalidityperiod;
        address _add;


    }


    //strcut to represent   a carborn credit verifier such as VERA

    struct verifier{

        string name;
        string homeCountry;
        uint reg_no;
        uint liences_no;
        address addr;
        bool isExist;


    }

    //struct to reprsent customer anyone wiling to offset

    struct customer{
        string first_name;
        string last_name;
        string email;
        uint  contact;
        uint _id;
    }


    //mapping of structs 
    mapping (uint =>CarbonCreditHolder) public CreditHolders;
    mapping (uint => verifier) public verifiers;
    mapping (uint=> customer) public customers;


   //declaration of events
   event newCreditHolder(string name,uint holderId, uint creditsHeld,uint pricepercredit,uint creditvalidityperiod,address _add);
   event newCustomer(string first_name, string last_name,string email, uint contact, uint _id);
   event newVerifier(string name,  string homeCountry, uint reg_no, uint liences_no, address addr);


//registering a  carbon creditholder body such as a forest reserves
   function  registerCreditHolder(string memory name, uint holderId,uint creditsHeld,uint pricepercredit,uint creditvalidityperiod)public{
       totalRegistered++;
       CreditHolders[totalRegistered] = CarbonCreditHolder(
           name,
           totalRegistered,
           holderId,
           creditsHeld,
           pricepercredit,
           creditvalidityperiod,
           msg.sender
       );

       emit newCreditHolder(name,holderId,creditsHeld,pricepercredit,creditvalidityperiod,msg.sender);
       

   }
   function registerVerifiers(string memory name, string memory homeCountry,uint reg_no, uint liences_no )public {

       verifiercount++;
       //check if verifier exist already
       require(verifiers[reg_no].isExist==false,"validator already registered");

       verifiers[verifiercount]=verifier(name,homeCountry,reg_no,liences_no,msg.sender,true);

       emit newVerifier(name,homeCountry,reg_no,liences_no,msg.sender);


   }

   function registerCustomer(string memory first_name,string memory last_name, string memory email,uint   _id, uint  contact)public{
       customercount++;
       customers[customercount]=customer(
           first_name,
           last_name,
           email,
           _id,
           contact
          
       );

       emit newCustomer(first_name,last_name,email,_id,contact);
   }


function getVerifiers()public view returns (verifier[]memory){
    verifier[]memory ret =new verifier[](verifiercount);
    for(uint i = 0; i < verifiercount; i++){
        ret[i]= verifiers[i];
    }
    return ret;
}

function getCustomers()public view returns (customer[]memory){
    customer[]memory cus = new customer[](customercount);
    for(uint i = 0; i < customercount; i++){
        cus[i]= customers[i];
    }
    return cus;
}

function getCreditHolders()public view returns(CarbonCreditHolder[]memory){
    CarbonCreditHolder[]memory cred = new CarbonCreditHolder[](verifiercount);
    for(uint i = 0; i < totalRegistered; i++){
        cred[i] = CreditHolders[i];
    } 
    return cred;
}

   }




//token

Skip to content
CarbonCreditProject
/
Carbon-Project
Public
Code
Issues
1
Pull requests
Actions
Projects
More
Carbon-Project/credittoken.sol
@peternderitu
peternderitu Update credittoken.sol
 History
 1 contributor
66 lines (61 sloc)  2.46 KB
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import './carboncredits.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

//SPDX-License-Identifier: UNLICENSED
contract CreditToken is CarbonCredits,ERC20{
    uint totalsupply;
    uint supply;
    uint tokenBurnedCount =0;
    uint8 private _decimals;
    
    constructor() ERC20("Carbon", "C") public {
        _setupDecimals(0);
    }
    mapping(address => uint) public BalanceOf;
    mapping(address => uint) public approvedCredits;
    mapping(address => uint) public tokensApprovedForBurn;
    modifier onlyVerifier() {
        require(msg.sender == verifiers[verifiercount].addr);
        _;
    }
    modifier onlyCreditHolder() {
        require(msg.sender == CreditHolders[totalRegistered]._addr);
        _;
    }
    function approveCreditsHeld(address _holder) public onlyVerifier{
        uint cred = CreditHolders[totalRegistered].creditsHeld;
        approvedCredits[_holder]+= cred;
    }

    function createCarbonToken() public onlyCreditHolder() returns(uint) {
        address Owner = CreditHolders[totalRegistered]._addr;
        supply = approvedCredits[Owner];
        totalsupply = totalsupply.add(supply);
        BalanceOf[Owner] = BalanceOf[Owner].add(supply);
        _mint(msg.sender, supply);
        return totalsupply;
    }
    function transferCredits(address to, uint value) public  onlyCreditHolder() {
        _transfer(msg.sender, to, value);
        BalanceOf[msg.sender] = BalanceOf[msg.sender].sub(value);
        BalanceOf[to] = BalanceOf[to].add(value);
    }
    function transferCreditsFrom(address from, address to, uint value) public {
        transferFrom(from, to, value);
        BalanceOf[from] = BalanceOf[from].sub(value);
        BalanceOf[to] = BalanceOf[to].add(value);
    }
    function approveBurn(uint carbonTokens, address holder) public onlyVerifier{
        tokensApprovedForBurn[holder]+=carbonTokens;
    }
    function burnTokens() public onlyOwner() returns(bool) {
        _burn(msg.sender, tokensApprovedForBurn[msg.sender]);
        totalsupply = totalsupply.sub(tokensApprovedForBurn[msg.sender]);
        BalanceOf[msg.sender] = BalanceOf[msg.sender].sub(tokensApprovedForBurn[msg.sender]);
        return true;
    }
    function buyCarbonCredits(uint amount) public payable {
        uint value = amount * 1;
        require(msg.value > 0);
        transferCreditsFrom(address(this),msg.sender, value);
        }

}
Footer
© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Carbon-Project/credittoken.sol at main · CarbonCreditProject/Carbon-Project




//certification 

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import './credittoken.sol';

//SPDX-License-Identifier: UNLICENSED
contract Certification is CreditToken {
    constructor() public { }
    string public constant _name = 'Gold Standard';
    string public constant _symbol = 'GS';
    
  mapping (uint => address) internal idToOwner;
  mapping (uint => address) internal idToApproval;
  mapping (address => uint) private ownerToNFTokenCount;
  mapping (address => uint) public burnedTokens;
  
  function addBurnedTokens(address holder) public {
    if (burnTokens() == true) {
        uint burnedtok = tokensApprovedForBurn[holder];
        burnedTokens[holder]+=burnedtok;
    }
  }

    function mint(address _to,uint256 _tokenId) internal virtual
  {
    require(_to != address(0), "ZERO_ADDRESS");
    require(idToOwner[_tokenId] == address(0), "NFT_ALREADY_EXISTS");
    require(burnedTokens[_to] > 20);

    _addNFToken(_to, _tokenId);

    emit Transfer(address(0), _to, _tokenId);
  }
  function _addNFToken(
    address _to,
    uint256 _tokenId
  )
    internal
    virtual
  {
    require(idToOwner[_tokenId] == address(0), "NFT_ALREADY_EXISTS");

    idToOwner[_tokenId] = _to;
    ownerToNFTokenCount[_to] = ownerToNFTokenCount[_to].add(1);
  }
}
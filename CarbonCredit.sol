// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';


contract CarbonCredit  is Ownable{

    uint  totalRegistered = 0;
    uint verifiercount = 0;
    uint customercount = 0;

    struct CarbonCreditHolder{
        string name;
        uint id;
        uint holderId;
        uint creditsHeld;
        uint pricepercredit;
        uint creditvalidityperiod;
        address _add;


    }

    struct verifier{

        string name;
        string homeCountry;
        uint reg_no;
        uint liences_no;
        address addr;
        bool isExist;


    }

    struct customer{
        string first_name;
        string last_name;
        string email;
        uint  contact;
        uint _id;
    }

    mapping (uint =>CarbonCreditHolder) public CreditHolders;
    mapping (uint => verifier) public verifiers;
    mapping (uint=> customer) public customers;

   event newCreditHolder(string name,uint holderId, uint creditsHeld,uint pricepercredit,uint creditvalidityperiod,address _add);
   event newCustomer(string first_name, string last_name,string email, uint contact, uint _id);
   event newVerifier(string name,  string homeCountry, uint reg_no, uint liences_no, address addr);

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


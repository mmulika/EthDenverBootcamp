// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract WeastContract{
      uint value;
      uint256 totalGabage = 0;
      uint256 verifierCount = 0;

       //struct Collector
      struct Collector{
          string name;
        uint256 hudumaNumber;
        string  location ;
        uint256 phoneNumber;
        uint weight;
      }
 //struct verifier

 struct verifier{
     string name;
     address add;
     uint256 license;
     string location;
     uint256 validityPeriod;

 }
 
 struct  forest{
    uint  reg;
    uint size;
    string location;
    uint contact;

 }

    //event

    event RegisterCollector( string name, uint256 hudumaNumber, string location, uint256 phoneNumber, uint weight);

      //mapping 
      mapping(uint256 => Collector) Collectors;
      mapping(uint256 => verifier)  verifiers;
      //function  to register  a collector
      function CreateCollector( string memory name, uint256 hudumaNumber,string  memory location,uint256 phoneNumber,uint256 weight)public{
          totalGabage++;
          Collectors[totalGabage] = Collector(
              name,
              hudumaNumber,
              location,
              phoneNumber,
              weight

          );

          emit RegisterCollector(name, hudumaNumber,location,phoneNumber,weight);
      }

      //function register waste verifier

      function CreateVerifiers( string memory name, address add, uint256 license, string memory location, uint256 validityPeriod)public{
      verifierCount++;
      verifiers[ verifierCount]=  verifier(
          name,
          add,
          license,
          location,
          validityPeriod

      );

      }

      function getCollector()public view returns(Collector[]memory){
          Collector[] memory ret = new Collector[](totalGabage);
          for( uint i = 0; i < totalGabage; i++){
              ret[i] = Collectors[i];

          }
          return ret;
      }

     function  Collectors() public view  returns(collector[]memory){
      return collector;


     }

}
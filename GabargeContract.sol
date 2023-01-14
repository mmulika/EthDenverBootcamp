// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract WeastContract{
     uint value;

      uint256 totalGabage = 0;

      struct Collector{
          string name;
        uint256 hudumaNumber;
        string  location ;
        uint256 phoneNumber;
        uint weight;

      }

      //mapping 

      mapping(uint256 => Collector) Collectors;


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
      }

}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


//importing  openzepplin contracts 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT  is ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


  //constructor fot the nft
    constructor() ERC721("Africa Blockanin  Centre","ABC"){}


    function mintNft(address recipient, string memory tokenURI) public returns(uint){

        _tokenIds.increment();
        uint newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }


  struct GreenToken{
    address  owner;
    uint256 value;

  }

  GreenToken public greenToken;
  event GreenTokenCreated ( address);


  function getGreenToken() public view returns (address){
    return  greenToken.owner;

  }

  function setGreenToken(address _add, uint256 _amount) public{
    greenToken.owner = _add;
    greenToken.value = _amount;
    emit GreenTokenCreated( _add);
  }


  struct VerifiedCredit{
    address verifierAdd;
    uint amount;
    string verifierName;
  }



  

}

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


}

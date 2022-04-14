// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract Jamadar is ERC1155, Ownable {
    uint256[] supplies=[50,100,150];
    IERC20 public token;
    uint256[] minted=[0,0,0];
    uint256[] prices=[0 ether, 0 ether, 0 ether];
    constructor()
        ERC1155("https://gateway.pinata.cloud/ipfs/QmV18Q9UKS5MXZMHWaG7eRPCZfHYTtz4Hfk8k31EfxPVTX")
    {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint256 id, uint256 amount)
        public
        
        
    {
        
        
        
        token.transferFrom(msg.sender,address(this),amount);
        _mint(msg.sender,id,amount,"");
        
    }

   


}

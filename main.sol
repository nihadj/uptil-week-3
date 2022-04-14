pragma solidity ^0.8.0;

import "./ERC721_question.sol";
import "./erc20Token.sol";

contract Main is Token{
    Token public token;
    
    uint256 price=10;
    constructor()payable{
        token=new Token();  
    }

    function deposit(uint tokenId,address nftHolder)public returns (uint){
        if(token.boolOfUsers(nftHolder)){
            userFungibleBal[tokenId][nftHolder]*=2;
            uint x=userFungibleBal[tokenId][nftHolder];
            return x;
            
        }
        return 999;
    }
        
    
    
    // function _mintNFT(address to)public {
    //     // (bool result,)=address(token).call(abi.encodeWithSignature("mint(address)",to));
    //     // require(result,"unable to call");
    //     // (bool result1,bytes memory data1)=address(token).call(abi.encodeWithSignature("currentVal()"));
    //     // require(result1);
    //     // emit tokenId(abi.decode(data1,(uint256)));

         mint(to);
        
    // }

    

    
}
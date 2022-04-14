pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";

contract Token is ERC721,Ownable{
    constructor() ERC721("JAMA","JMA"){
    }
    using EnumerableMap for EnumerableMap.UintToAddressMap;

    using Counters for Counters.Counter;
    mapping(address=>bool) public users;
    mapping(address=>uint) public bal;
    mapping(uint=>mapping(address=>uint)) userFungibleBal;
    Counters.Counter public _count;
    //EnumerableMap.UintToAddressMap private users;
    
    function mint(address to,uint amount) public payable onlyOwner{
        
        _count.increment();
        require(!users[to]);
        _mint(to,_count.current());
        userFungibleBal[_count.current()][to]=amount;
        users[to]=true;
        bal[to]=_count.current();
        
    }
    function balanceOwner()public view returns(uint){
        uint x=owner().balance;
        return x;
    }
    function boolOfUsers(address nftHolder)public view returns (bool){
        bool x=users[nftHolder];
        return x;
    }
    function currentVal() public view returns(uint256){
        return _count.current();
    }



    


}
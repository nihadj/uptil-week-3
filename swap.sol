//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./A_Token.sol";
import "./B_Token.sol";

interface Token{
function totalSupply() external view returns (uint256);
function balanceOf(address _owner) external view returns (uint256 balance);
function transfer(address _to, uint256 _value) external returns (bool success);
function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
function approve(address _spender, uint256 _value) external returns (bool success);
function allowance(address _owner, address _spender) external view returns (uint256 remaining);

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);


}

contract Swap{
    Token public token1;
    address public owner1;
    Token public token2;
    address public owner2;


    constructor(
        address _token1,
        address _owner1,
        address _token2,
        address _owner2
    )public{
        token1=Token(_token1);
        owner1=_owner1;
        token2=Token(_token2);
        owner2=_owner2;
    }


    function swap(uint amount1,uint amount2)public payable{
        uint x=(token1.allowance(owner1,address(this)));
        uint y=(token2.allowance(owner2,address(this)));
        require(2*y==x);
        safeTransferFrom(token1,x,token2,y,owner1,owner2);
        

    }

    function safeTransferFrom(Token token1_,uint amount1,Token token2_,uint amount2,address owner1_,address owner2_)public{
        bool a=token1_.transferFrom(address(this),owner2_,amount1);
        bool b=token2_.transferFrom(address(this),owner1_,amount2);
        require(a&&b);

    }
    

    

}
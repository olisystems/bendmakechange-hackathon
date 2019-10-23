pragma solidity ^0.5.2;
contract Ownable{
    address public owner;

    constructor()public{
        owner= msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
}
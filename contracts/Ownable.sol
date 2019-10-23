pragma solidity >=0.4.16 <0.6.0;

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
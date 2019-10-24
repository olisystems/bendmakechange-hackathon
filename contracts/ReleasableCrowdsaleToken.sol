pragma solidity >=0.4.16 <0.6.0;

import './CrowdsaleToken.sol';

contract ReleasableCrowdsaleToken is CrowdsaleToken {
    bool public released = false;

    modifier isReleased(){
        if (!released) {
            revert();
        }
        _;
    }

    constructor (uint256 _initialSupply) CrowdsaleToken(_initialSupply) public {

    }

    function release() onlyOwner public {
        released = true;
    }

    function transfer(address _to, uint256 _tokens) isReleased public returns (bool){
        super.transfer(_to, _tokens);
    }

    function transferFrom(address _from, address _to, uint256 _tokens) isReleased public returns (bool){
        super.transferFrom(_from, _to, _tokens);
    }
}
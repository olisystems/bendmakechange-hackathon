pragma solidity >=0.4.16 <0.6.0;

import './CrowdsaleToken.sol';

// ReleasableCrowdsaleToken is inherited from CrowdsaleToken
contract ReleasableCrowdsaleToken is CrowdsaleToken {
    bool public released = false;
    // modifier to release tokens
    modifier isReleased(){
        if (!released) {
            revert();
        }
        _;
    }

    constructor (uint256 _initialSupply) CrowdsaleToken(_initialSupply) public {

    }
    // onlyOwner can release
    function release() onlyOwner public {
        released = true;
    }
    // allow transfer token only when released
    function transfer(address _to, uint256 _tokens) isReleased public returns (bool){
        super.transfer(_to, _tokens);
    }
    // allow transferFrom token only when released
    function transferFrom(address _from, address _to, uint256 _tokens) isReleased public returns (bool){
        super.transferFrom(_from, _to, _tokens);
    }
}
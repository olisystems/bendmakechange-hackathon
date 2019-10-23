pragma solidity >=0.4.16 <0.6.0;

contract SimpleStorage {
    uint storeddata;

    function set(uint x) public {
        storeddata = x;
    }

    function get() public view returns (uint){
        return storeddata;
    }
}
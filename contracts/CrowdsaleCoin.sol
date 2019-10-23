pragma solidity >=0.4.16 <0.6.0;

import "./SafeMath.sol";

contract CrowdsaleCoin {

    using SafeMath for uint;
    uint256 public totalTokenSupply;

    // 1. declaring the meta information for the coin
    string public constant name = 'CrowdsaleCoin';
    string public constant symbol = 'CSC';

    /*
     * E.g. decimals = 2, value 100 => 1.00
     * E.g. decimals = 1, value 100 => 10.0
     */
    uint8 public constant decimals = 2;

    // 2. mapping
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    // 3. events
    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);

    constructor(uint256 _supply) public{
        totalTokenSupply = _supply;
    }

    // get total token supply
    function getTotalSupply() public view returns (uint256){
        return totalTokenSupply;
    }

    // transfer tokens function
    function transfer(address _to, uint256 _tokens) public returns (bool) {
        // check if sender has enough token to transfer
        require(balances[msg.sender] >= _tokens && _tokens > 0);

        balances[msg.sender] = balances[msg.sender].sub(_tokens);
        balances[_to] = balances[_to].add(_tokens);

        emit Transfer(msg.sender, _to, _tokens);
        return true;
    }

    // checking out the balances
    function balanceOf(address _tokenOwner) public view returns (uint256 _tokens) {
        return balances[_tokenOwner];
    }

    // approve spender to spend tokens
    function approve(address _spender, uint256 _tokens) public returns (bool success) {
        require(_tokens > 0
            && balances[msg.sender] > 0);

        allowances[msg.sender][_spender] = _tokens;
        emit Approval(msg.sender, _spender, _tokens);
        return true;
    }

    // checking the amount of allowed tokens
    function allowance(address _tokenOwner, address _spender) public view returns (uint remaining) {
        return allowances[_tokenOwner][_spender];
    }

    // spending allowed tokens on behalf of owner
    function transferFrom(address _from, address _to, uint256 _tokens) public returns (bool success) {
        require(_tokens > 0
        && balances[_from] >= _tokens
            && allowances[_from][msg.sender] >= _tokens);

        balances[_from] = balances[_from].sub(_tokens);
        balances[_to] = balances[_to].add(_tokens);

        allowances[_from][msg.sender] = allowances[_from][msg.sender].sub(_tokens);
        emit Transfer(_from, _to, _tokens);
        return true;
    }

}
pragma solidity ^0.5.2;

import './CrowdsaleToken.sol';

contract WPPCrowdsale {

    // state variables
    uint256 public startTime;
    uint256 public endTime;
    uint256 public weiTokenPrice;
    uint256 public weiInvestmentObjective;

    // map account investments
    mapping(address => uint256) public investmentAmountOf;
    uint256 public investmentReceived;
    uint256 public investmentRefunded;

    bool public isFinalized;
    bool public isRefundingAllowed;
    address public owner;

    // instance of the token contract
    CrowdsaleToken public crowdsaleToken;

    /*
    * take state variables as input
    * validate
    * instantiate
    */
    constructor(uint256 _startTime, uint256 _endTime, uint256 _weiTokenPrice, uint256 _weiInvestmentObjective) public{

    }

    /*
    * invest()
    * accept funds
    * convert funds into tokens
    * lock tokens until the crowdsale is finished
    */
    function invest() public payable {

    }

    /*
    * finalize()
    * check if the deadline is reached:
    * 1. if minimum objective is achieved
    * releases tokens
    * 2. else
    * refund investments to investors
    */
    function finalize() onlyOwner public {

    }

    /*
    * refund()
    * refund if crowdsale is unsuccessful
    * refund only if the investor has contributed
    */
    function refund() public {

    }

}
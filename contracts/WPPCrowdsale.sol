pragma solidity >=0.4.16 <0.6.0;

import './CrowdsaleCoin.sol';

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

    // events
    event LogInvestment(address indexed investor, uint256 investment);

    // instance of the token contract
    CrowdsaleCoin public crowdsaleCoin;

    /*
    * take state variables as input
    * validate
    * instantiate
    */
    constructor(uint256 _startTime, uint256 _endTime, uint256 _weiTokenPrice, uint256 _weiInvestmentObjective) public{
        require(_startTime >= now);
        require(_endTime >= _startTime);
        require(_weiTokenPrice != 0);
        require(_weiInvestmentObjective != 0);

        startTime = _startTime;
        endTime = _endTime;
        weiTokenPrice = _weiTokenPrice;
        weiInvestmentObjective = _weiInvestmentObjective * 1000000000000000000;

        crowdsaleCoin = new CrowdsaleCoin(0);
        isFinalized = false;
        isRefundingAllowed = false;
        owner = msg.sender;
    }

    /*
    * invest()
    * accept funds
    * convert funds into tokens
    * lock tokens until the crowdsale is finished
    */
    function invest() public payable {
        // accept funds
        require(isValidInvestment(msg.value));

        investmentAmountOf[msg.sender] += msg.value;
        investmentReceived += msg.value;

        // convert funds into tokens
        assignTokens(msg.sender, msg.value);
        emit LogInvestment(msg.sender, msg.value);

    }

    function isValidInvestment(uint256 _investment) internal view returns (bool){
        // check if investment is valid
        // funds are not zero
        // crowdsale period is not expired
        bool nonZeroInvestment = _investment != 0;
        // only for test purpose
        bool withinCrowdsalePeriod = now >= startTime && now <= endTime;
        return nonZeroInvestment && withinCrowdsalePeriod;
    }

    function assignTokens(address _beneficiary, uint256 _investment) internal {
        uint256 _tokens = calculateTokens(_investment);
        crowdsaleCoin.mint(_beneficiary, _tokens);
    }

    function calculateTokens(uint256 _investment) internal view returns (uint256){
        return _investment / weiTokenPrice;
    }

    /*
    * finalize()
    * check if the deadline is reached:
    * 1. if minimum objective is achieved
    * releases tokens
    * 2. else
    * refund investments to investors
    */
    function finalize() public {

    }

    /*
    * refund()
    * refund if crowdsale is unsuccessful
    * refund only if the investor has contributed
    */
    function refund() public {

    }

    function getTotalInvestment() public view returns (uint256){
        return investmentReceived;
    }

}
pragma solidity >=0.4.22 <0.7.0;

import './WPPCrowdsale.sol';

contract EnergySupply is WPPCrowdsale {
    // map consumption to house hold
    mapping(address => uint256)consumptionOf;
    // map energy supply to household
    mapping(address => uint256)suppliedEnergyOf;
    // event to show energy demand
    event Consumption(address household, uint256 consumption);
    // event to show energy supplied
    event EnergySupplied(address household, uint256 suppliedEnergy);
    // event to show energy production
    event EnergyProduction(uint256 _production);
    //event consumption greater than production
    event consumptionGreater(bool _status);
    //event consumption greater than production
    event consumptionlesser(bool _status);

    address [] households;

    uint256 totalConsumption;
    uint256 totalProduction;
    constructor(uint256 _startTime, uint256 _endTime, uint256 _weiTokenPrice, uint256 _weiInvestmentObjective, uint256 _initialSupply)
    WPPCrowdsale(_startTime, _endTime, _weiTokenPrice, _weiInvestmentObjective, _initialSupply)public{
    }
    function sendConsumption(uint256 _consumption) public {
        households.push(msg.sender);
        consumptionOf[msg.sender] = _consumption;
        totalConsumption += _consumption;
        super.transfer(owner, _consumption);
        emit Consumption(msg.sender, _consumption);
    }

    function supplyEnergy(address _household, uint256 _energy) public {
        suppliedEnergyOf[_household] = _energy;
        emit EnergySupplied(_household, _energy);
    }

    function getEnergyProduction(uint256 _production) public returns (uint256){
        totalProduction += _production;
        emit EnergyProduction(_production);
        sumProductionConsumpt();
        return _production;
    }

    function sumProductionConsumpt() internal returns (uint256){
        if (totalConsumption > totalProduction) {
            emit consumptionGreater(true);
        }
        else {
            emit consumptionlesser(true);
        }
    }

    function calculateShare() internal {
        for (uint8 i = 0; i < households.length; i++) {
            uint256 share = (totalProduction / totalConsumption) * consumptionOf[households[i]];
            uint256 amoutToReturn = consumptionOf[households[i]] - share;
            super.transferFrom(owner, households[i], amoutToReturn);
        }

    }
}
const SimpleStorage = artifacts.require("SimpleStorage");
const WPPCrowdsale = artifacts.require("WPPCrowdsale");

module.exports = function (deployer) {

    deployer.deploy(SimpleStorage);
    deployer.deploy(WPPCrowdsale, 1571871202, 1572041242, 10, 10);
};
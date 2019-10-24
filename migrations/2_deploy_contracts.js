const SimpleStorage = artifacts.require("SimpleStorage");
const WPPCrowdsale = artifacts.require("WPPCrowdsale");

module.exports = function (deployer) {
    const currentTime = Math.round((new Date()).getTime() / 1000);
    const endTime = currentTime + 432000;

    deployer.deploy(SimpleStorage);
    deployer.deploy(WPPCrowdsale, currentTime, endTime, 10, 10);
};
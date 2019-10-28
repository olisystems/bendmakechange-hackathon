
const EnergySupply = artifacts.require("EnergySupply");

module.exports = function (deployer) {
    // const currentTime = (new Date).getTime();
    let currentTime = (Math.round((new Date()).getTime() / 1000));
    currentTime = currentTime + 250;
    const endTime = currentTime + 432000

    deployer.deploy(EnergySupply, currentTime, endTime, 10, 10, 0);
};
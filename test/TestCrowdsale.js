var WPPCrowdsale = artifacts.require('../app/src/assets/js/contracts/WPPCrowdsale')
const truffleAssert = require('truffle-assertions');

contract('WPPCrowdsale', function (accounts) {

    const ownerID = accounts[0]

    // 1st Test
    it("Testing smart contract function invest() that allows an investor to invest funds", async () => {
        const wPPCrowdsale = await WPPCrowdsale.deployed()

        const result = await wPPCrowdsale.invest({ from: ownerID, value: 100000000000000000 })
        console.log(result.logs);

        let investment = await wPPCrowdsale.getTotalInvestment.call()
        investment = web3.utils.fromWei(investment, "ether");

        assert.equal(investment, 0.1, 'Invalid event emitted')
        //truffleAssert.eventEmitted(result, 'LogInvestment');
        truffleAssert.eventEmitted(result, 'Transfer');
    })


})
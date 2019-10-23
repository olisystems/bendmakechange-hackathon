var WPPCrowdsale = artifacts.require('../app/src/assets/js/contracts/WPPCrowdsale')

contract('WPPCrowdsale', function (accounts) {

    const ownerID = accounts[0]

    // 1st Test
    it("Testing smart contract function invest() that allows an investor to invest funds", async () => {
        const wPPCrowdsale = await WPPCrowdsale.deployed()


        await wPPCrowdsale.invest({ from: ownerID, value: 1 })
        let investment = await wPPCrowdsale.getTotalInvestment.call()
        investment = (web3.fromWei(xx.toNumber(), "wei"));


        assert.equal(investment, 1, 'Invalid event emitted')
    })


})
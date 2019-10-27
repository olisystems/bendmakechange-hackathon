<template>
  <div class="main">
    <h1>Bend Make Change - Hackathon 2019</h1>
    <button @click="storeValue">submit</button>
  </div>
</template>

<script>
import web3 from "../assets/js/web3";
//import ContractInstance from "../assets/js/ContractInstance";
export default {
  name: "Main",
  data() {
    return {
      account: "0x0000000000000000000000000000000000000000",
      contract: ""
    };
  },

  methods: {
    async getMetamaskAccount() {
      web3.eth.getAccounts((err, res) => {
        if (err) {
          console.log(err);
          return;
        }
        this.account = res[0];
        console.log(this.account);
      });
    },

    creatContractInstance() {
      this.contract = new web3.eth.Contract(
        [{"constant":false,"inputs":[{"internalType":"address","name":"_spender","type":"address"},{"internalType":"uint256","name":"_tokens","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"finalize","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"_production","type":"uint256"}],"name":"getEnergyProduction","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"invest","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"_recipient","type":"address"},{"internalType":"uint256","name":"_mintedAmount","type":"uint256"}],"name":"mint","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"refund","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"release","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"_consumption","type":"uint256"}],"name":"sendConsumption","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"_household","type":"address"},{"internalType":"uint256","name":"_energy","type":"uint256"}],"name":"supplyEnergy","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"_to","type":"address"},{"internalType":"uint256","name":"_tokens","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"_from","type":"address"},{"internalType":"address","name":"_to","type":"address"},{"internalType":"uint256","name":"_tokens","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_startTime","type":"uint256"},{"internalType":"uint256","name":"_endTime","type":"uint256"},{"internalType":"uint256","name":"_weiTokenPrice","type":"uint256"},{"internalType":"uint256","name":"_weiInvestmentObjective","type":"uint256"},{"internalType":"uint256","name":"_initialSupply","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"household","type":"address"},{"indexed":false,"internalType":"uint256","name":"consumption","type":"uint256"}],"name":"Consumption","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"household","type":"address"},{"indexed":false,"internalType":"uint256","name":"suppliedEnergy","type":"uint256"}],"name":"EnergySupplied","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"_production","type":"uint256"}],"name":"EnergyProduction","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"investor","type":"address"},{"indexed":false,"internalType":"uint256","name":"investment","type":"uint256"}],"name":"LogInvestment","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"investor","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Refund","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokens","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"tokenOwner","type":"address"},{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokens","type":"uint256"}],"name":"Approval","type":"event"},{"constant":true,"inputs":[{"internalType":"address","name":"_tokenOwner","type":"address"},{"internalType":"address","name":"_spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"}],"name":"allowances","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"_tokenOwner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"_tokens","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"balances","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"endTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getEndTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getFinalizedStatus","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getRefundingStatus","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getStartTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getTotalInvestment","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getTotalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"investmentAmountOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"investmentReceived","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"investmentRefunded","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"isFinalized","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"isRefundingAllowed","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"internalType":"address payable","name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"released","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"startTime","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"totalTokenSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"weiInvestmentObjective","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"weiTokenPrice","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}],
        "0xe8624A2AdE2B2E91F657C4B95a1558b216394801"
      );
    },

    storeValue() {
      this.invest();
      this.getVariables();
    },
    async invest() {
      // create contract instance
      //const EnergySupply = await ContractInstance();
      this.contract.methods.invest()
      .send({ from: this.account, value: 100000000000000 })
      .then(function(receipt) {
        console.log(receipt);
      });
    },

    async getVariables() {
      // create contract instance
      // const EnergySupply = await ContractInstance();
      this.contract.methods.getStartTime().call(function(err, res) {
        //do something with res here
        console.log(res); //for example
      });
      this.contract.methods.getEndTime().call(function(err, res) {
        //do something with res here
        console.log(res); //for example
      });
      this.contract.methods.getTotalInvestment().call(function(err, res) {
        //do something with res here
        console.log(res); //for example
      });
      this.contract.methods.getRefundingStatus().call(function(err, res) {
        //do something with res here
        console.log(res); //for example
      });
    }
  },
  created() {
    this.getMetamaskAccount();
    this.creatContractInstance();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>

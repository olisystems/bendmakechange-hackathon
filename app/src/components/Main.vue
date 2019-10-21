<template>
  <div class="main">
    <h1>Bend Make Change - Hackathon 2019</h1>
    <button @click="storeValue">submit</button>
  </div>
</template>

<script>
import web3 from "../assets/js/web3";
import ContractInstance from "../assets/js/ContractInstance";
export default {
  name: "Main",
  data() {
    return {
      account: "0x0000000000000000000000000000000000000000"
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
      });
    },

    async storeValue() {
      // create contract instance
      const SimpleStorage = await ContractInstance();
      // call contract method
      SimpleStorage.methods
        .set(123)
        .send({ from: this.account })
        .then(function(receipt) {
          console.log(receipt);
        });
    }
  },
  created() {
    this.getMetamaskAccount();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>

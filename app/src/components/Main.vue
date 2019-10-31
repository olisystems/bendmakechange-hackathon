<template>
  <div class="container">
    <div class="insight">
      <div class="overview col">
        <div class="col-header">
          <h4>Wind Power Plant Project</h4>
        </div>
        <div class="col-body">
          <div class="progress-bar">
            <div class="percentage" :style="{'width': percentage + '%'}"></div>
        </div>
          <div class="percentage-label">
            <span>{{percentage}}%</span>
      </div>
          <div class="label">
            <h4>{{investmentReceived}}/{{goal}}</h4>
          </div>
          <form v-on:submit.prevent="invest">
            <button>Invest!</button>
          </form>
        </div>
      </div>

      <div class="details col">
        <div class="col-header">
          <h4>Project Details</h4>
        </div>
        <div class="col-body details-col">
          <p>Contract Address:</p>
          <span>0xe8624A2AdE2B2E91F657C4B95a1558b216394801</span>

          <p>Owner Address:</p>
          <span>{{owner}}</span>

          <p>Contributors:</p>
          <span>{{numberOfInvestors}}</span>

          <p>Balance:</p>
          <span>{{investmentReceived}}</span>
        </div>
      </div>
    </div>

    <div class="investors">
      <div class="col table-col table">
        <div class="table-wrapper">
          <v-table :data="investmentDetails">
            <thead slot="head">
              <th class="investor-col">Investors</th>
          <th>Investment</th>
            </thead>
            <tbody slot="body" slot-scope="{displayData}">
              <tr v-for="(row, index) in displayData" :key="index">
                <td>{{row.investor}}</td>
                <td>{{row.investment}}</td>
        </tr>
            </tbody>
          </v-table>
    </div>
  </div>
    </div>
  </div>
</template>

<script>
import web3 from "../assets/js/web3";
import ContractInstance from "../assets/js/ContractInstance";
export default {
  name: "Main",
  data() {
    return {
      account: "0x0000000000000000000000000000000000000000",
      contract: "",
      investmentReceived: "",
      investors: [],
      investmentDetails: [],
      numberOfInvestors: "",
      owner: "",
      goal: ""
    };
  },

  methods: {
    getMetamaskAccount() {
      web3.eth.getAccounts((err, res) => {
        if (err) {
          console.log(err);
          return;
        }
        this.account = res[0];
        console.log(this.account);
      });
    },

    getInvestors() {
      this.contract
        .getPastEvents("LogInvestment", {
          fromBlock: 0,
          toBlock: "latest"
        })
        .then(events => {
          events.forEach(event => {
            this.investmentDetails.push({
              investor: event.returnValues[0],
              investment: event.returnValues[1]
            });

            this.investors.push(event.returnValues[0]);
          });

          const uniqueInvestors = [...new Set(this.investors)];
          this.numberOfInvestors = uniqueInvestors.length;

          console.log(this.investmentDetails);
        });
    },
    async getTotalInvestment() {
      this.investmentReceived = await this.contract.methods
        .investmentReceived()
        .call();
    },

    async getOwner() {
      this.owner = await this.contract.methods.owner().call();
    },
    async getGoal() {
      this.goal = await this.contract.methods.weiInvestmentObjective().call();
    },
    getProjectDetails() {
      this.getInvestors();
      this.getTotalInvestment();
      this.getOwner();
      this.getGoal();
    },
    async invest() {
      // create contract instance
      //const EnergySupply = await ContractInstance();
      this.contract.methods
        .invest()
        .send({ from: this.account, value: 100167000000 })
        .then(function(receipt) {
          console.log(receipt);
        });
    }
  },
  async created() {
    this.getMetamaskAccount();
    this.contract = await ContractInstance();
    this.getProjectDetails();
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.main {
  padding: 2rem;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  text-align: left;
  border-bottom: 2px solid #dee2e6;
}
.col {
  padding: 0.5rem;
  border: 1px solid #dee2e6;
  background: #fff;
  border-radius: 2px;
  box-shadow: 0 10px 30px rgba(51, 51, 51, 0.1);
  display: flex;
  flex-direction: column;
}
.col-left {
  width: 50%;
}
.col-center,
.col-right {
  width: 40%;
}
.col-header {
  margin-bottom: 0.5rem;
  border-bottom: 1.5px solid #e1dfe2;
}

.col-body {
  padding: 1.5rem;
  border: 1px solid #c3c6c7;
}

.listDID,
.resolveDID {
  height: 300px;
  overflow-y: auto;
}

input {
  width: 100%;
  margin: 1rem;
  padding: 0.5rem;
  box-sizing: border-box;
  border: 1px solid #abaeaf;
  border-radius: 1px;
  margin: 1rem auto;
}

button {
  padding: 0.8rem;
  border: 1px solid #013646;
  border-radius: 2px;
  color: #fff;
  font-size: 0.8rem;
  cursor: pointer;
  float: right;
  background-color: #154360;
  -webkit-transition-duration: 0.4s;
  transition-duration: 0.4s;
}

.list {
  margin-top: 0;
  padding: 0 1rem;
}

li {
  list-style-position: inside;
  padding: 1em;
  cursor: pointer;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
ul > li:after {
  content: "";
  display: block;
  width: 85%;
  padding-top: 0.5em;
  border-bottom: 1px solid rgb(206, 204, 204);
}

ul > li:last-child:after {
  border-bottom: none;
}
ul > li:hover {
  background: rgba(0, 0, 0, 0.075);
}

.active {
  background-color: #d6d8db;
}

.table table {
  table-layout: fixed;
  width: 100%;
}
tbody {
  text-align: left;
}
th {
  background-color: #ccb9da;
  padding: 5px;
}
td {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  padding: 10px;
}
th,
td {
  border-bottom: 1px solid #cccccc;
}
th:last-child,
td:last-child {
  width: 80px;
}
</style>

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
    // get investors and their investment
    getInvestors() {
      this.investmentDetails = [];
      this.investors = [];
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
          // filter out duplicate investors
          const uniqueInvestors = [...new Set(this.investors)];
          this.numberOfInvestors = uniqueInvestors.length;
        });
    },
    // get the total investment received
    async getTotalInvestment() {
      this.investmentReceived = await this.contract.methods
        .investmentReceived()
        .call();
    },
    // get the address of contract owner
    async getOwner() {
      this.owner = await this.contract.methods.owner().call();
    },
    // get the minimum investment goal
    async getGoal() {
      this.goal = await this.contract.methods.weiInvestmentObjective().call();
    },
    // get project details
    getProjectDetails() {
      this.getTotalInvestment();
      this.getOwner();
      this.getGoal();
    },
    async invest() {
      await this.contract.methods
        .invest()
        .send({ from: this.account, value: 100167000000 });
      // fetch the updated investment
      this.getTotalInvestment();
    }
  },
  // watch investment received
  watch: {
    investmentReceived() {
      this.getProjectDetails();
      this.getInvestors();
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
.container {
  padding: 2rem;
  display: flex;
  flex-direction: column;
}

.insight {
  display: flex;
  text-align: left;
  align-items: flex-start;
  flex-flow: row wrap;
  justify-content: space-between;
  padding-bottom: 2rem;
  margin-bottom: 2rem;
  border-bottom: #e1dfe2 2px solid;
}

.investors {
  display: flex;
  justify-content: center;
}

.col {
  padding: 0.5rem;
  border: 1px solid #dee2e6;
  background: rgb(255, 252, 252);
  border-radius: 2px;
  display: flex;
  flex-direction: column;
  width: 45%;
}

.col-header {
  margin-bottom: 0.5rem;
  border-bottom: 1.5px solid #e1dfe2;
}

.col-body {
  padding: 1rem;
  border: 1px solid #c3c6c7;
}

.details-col,
.table-col {
  height: 290px;
  overflow-y: auto;
}
.progress-bar {
  margin-top: 1.5rem;
  height: 30px;
  border-radius: 15px;
  border: #ddd 1px solid;
}

.percentage {
  height: 100%;
  border-radius: 15px;
  background: #a5df41;
  background-image: repeating-linear-gradient(
    135deg,
    #62c03c,
    #62c03c 5px,
    #a5df41 5px,
    #a5df41 10px
  );
  animation: animate-stripes 3s linear infinite;
}
.percentage-label {
  padding: 1rem;
  text-align: center;
}
.label {
  font-size: calc(0.7vw + 0.7vh + 0.7vmin);
  color: #394f7c;
}
p {
  font-weight: 400;
  font-size: calc(0.5vw + 0.5vh + 0.5vmin);
}
span {
  font-weight: bold;
  color: #394f7c;
  font-size: 1em;
  font-family: "Open Sans", sans-serif;
  font-style: normal;
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
.table-header {
  /* background-color: #cdf1c3; */
  text-align: left;
  margin-bottom: 0.5rem;
  border-bottom: 1.5px solid #e1dfe2;
}

.table-wrapper {
  border: #dee2e6 1px solid;
  margin: 0.5rem;
  border-radius: 2px;
}

.table {
  height: 300px;
  overflow-y: auto;
}

table {
  table-layout: fixed;
  width: 100%;
  padding: 0.5rem;
}

th {
  background: #f2f0f3;
  border: #d8d3d3 1px solid;
  border-radius: 2px;
  font-size: 1rem;
  position: sticky;
  z-index: 5;
  top: 0;
}

.investor-col {
  width: 70%;
}

td,
th {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  padding: 0.5rem;
  font-size: 0.9rem;
}

td {
  border-bottom: 1px solid #cccccc;
}

tbody > tr:last-child > td {
  border-bottom: none;
}

/** progress bar stripes animation */
@keyframes animate-stripes {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 60px 0;
  }
}
</style>

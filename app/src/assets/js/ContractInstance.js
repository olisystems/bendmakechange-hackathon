import web3 from './web3';
import energySupplyArtifact from "./contracts/EnergySupply";

const ContractInstance = async function test() {

    //This method find the network id to retrieve the configuration from truffle-config.js file
    const networkId = await web3.eth.net.getId();
    // Retrieve the Network configuration from truffle-config.js file
    const deployedNetwork = energySupplyArtifact.networks[networkId];
    // Initializing the contract
    const EnergySupply = new web3.eth.Contract(
        energySupplyArtifact.abi,
        deployedNetwork.address
    );

    return EnergySupply;
}


export default ContractInstance;
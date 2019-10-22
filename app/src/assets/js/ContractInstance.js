import web3 from './web3';
import simpleStorageArtifact from "./contracts/SimpleStorage";

const ContractInstance = async function test() {

    //This method find the network id to retrieve the configuration from truffle-config.js file
    const networkId = await web3.eth.net.getId();
    // Retrieve the Network configuration from truffle-config.js file
    const deployedNetwork = simpleStorageArtifact.networks[networkId];
    // Initializing the contract
    const SimpleStorage = new web3.eth.Contract(
        simpleStorageArtifact.abi,
        deployedNetwork.address
    );

    return SimpleStorage;
}


export default ContractInstance;
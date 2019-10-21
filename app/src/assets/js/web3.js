/* eslint-disable */
import Web3 from 'web3';

// Find or Inject Web3 Provider
// Modern dapp browsers...
if (window.ethereum) {
    window.web3 = new Web3(ethereum);
    try {
        // Request account access
        window.ethereum.enable();
    } catch (error) {
        // User denied account access...
        console.error("User denied account access")
    }
    // Legacy dapp browsers...
} else if (window.web3) {
    window.web3 = new Web3(web3.currentProvider);
} else {
    // Non-dapp browsers...
    console.error('Non-Ethereum browser detected. You should consider trying MetaMask!')
}

export default web3;
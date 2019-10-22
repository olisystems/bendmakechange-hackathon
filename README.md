# Wind Power Plant Project
Crowdfunding DApp - Bend Make Change Hackathon 2019

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Please make sure you've already installed ganache-cli, Truffle and enabled MetaMask extension in your browser.

```
* Truffle v4.1.16 (core: 4)
* Solidity - ^0.4.25 (solc-js)
* Node v10.16.3
```

### Installing

A step by step series of examples that tell you have to get a development env running

1. Clone this repository:

```
git clone https://github.com/olisystems/bendmakechange-hackathon
```

2. Install all the requisite npm packages (as listed in ```package.json```) in the project directory.

```$ npm install```

3. Change directory to ```app``` folder and install all requisite npm packages (as listed in ```package.json```):

```
$ cd app
$ npm install
```

4. Launch Ganache:

```
$ ganache-cli
```

5. In a separate terminal window, Compile smart contracts:

```
truffle compile
```

This will create the smart contract artifacts in folder ```src\assetes\jscontracts```.

6. Migrate smart contracts to the locally running blockchain, ganache-cli:

```
truffle migrate
```

7. In a separate terminal window, launch the DApp:

```
npm run dev
```
**NOTE:** In order to send the transaction, you need to import one of the account provided by `ganache` to Metamask.
// your code here

const Web3 = require('web3');
const HDWalletProvider = require('truffle-hdwallet-provider');

const { interface, bytecode } = require('./compile');

const provider  = new HDWalletProvider(
  'dad body entry seat deal atom wrist nerve breeze swap myth boy',
  'https://rinkeby.infura.io/v3/7e4166111413499eaa120d8d3cba05f0');
  // your code here 
const web3 = new Web3(provider); // your code here

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0] ); // address of the deployer
  console.log(bytecode)
  const result = await new web3.eth.Contract(JSON.parse(interface))
 .deploy({ data: '0x' + bytecode,arguments:[1000,'Ali',0,'A',100]})
 .send({ gas: '1000000', from: accounts[0]});// your code here
  console.log('Contract deployed to', result.options.address); //address of the deployed contract
};
deploy();

const Web3 = require('web3')
const contractABI = [
    [
        {
            "inputs": [
                {
                    "internalType": "string",
                    "name": "_name",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "_metadata",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "_ipfsHash",
                    "type": "string"
                }
            ],
            "stateMutability": "nonpayable",
            "type": "constructor"
        },
        {
            "inputs": [
                {
                    "internalType": "address",
                    "name": "_spender",
                    "type": "address"
                },
                {
                    "internalType": "address",
                    "name": "_to",
                    "type": "address"
                }
            ],
            "name": "approve",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "getInfo",
            "outputs": [
                {
                    "internalType": "address",
                    "name": "",
                    "type": "address"
                },
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "string",
                    "name": "_name",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "_metadata",
                    "type": "string"
                },
                {
                    "internalType": "string",
                    "name": "_ipfsHash",
                    "type": "string"
                }
            ],
            "name": "mint",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "address",
                    "name": "_to",
                    "type": "address"
                }
            ],
            "name": "transfer",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ]
]
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))

const contractAddress = '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4';
const contract = new web3.eth.Contract(contractABI, contractAddress);
console.log(contract)

//function to list all functions

contractABI.forEach(function(json){
    console.log(json.name)
})


const contractFunctions = contract._jsonInterface;
contractFunctions.forEach(function(json) {
    console.log(json.name);
})

contract.methods.getData().call((err, result) => {
    if (err) {
        console.error(err);
    } else {
        console.log(result);
    }
});


contract.methods.setData("data").send({from: '0xYourAddress'})
.then((receipt) => {
  console.log(receipt);
});


//todo read on contract methods
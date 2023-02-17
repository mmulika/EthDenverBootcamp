const { Keyring } = require('@polkadot/api');

// Generate a new keypair
const keyring = new Keyring({ type: 'sr25519' });
const pair = keyring.createPair();

// Get the account address
const address = pair.address;

console.log(`Address: ${address}`);

// Sign a message
const message = 'Hello, Polkadot!';
const signature = pair.sign(message);

console.log(`Message: ${message}`);
console.log(`Signature: ${signature}`);

// Verify the signature
const isVerified = pair.verify(message, signature);

console.log(`Is signature verified? ${isVerified}`);

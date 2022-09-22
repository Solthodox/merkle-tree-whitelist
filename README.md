# Merkle Tree Whitelist
This project aims to drastically reduce the gas consumption of a whitelist using Merkle Proof to encrypt a big amount of data with very little proof.

## How it works

![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Hash_Tree.svg/1200px-Hash_Tree.svg.png)

Thanks to merkle tree algorithm we are able to verify if an element is inlcluded inside a big amount of data. This algorith takes pairs of data and encrypts them , then takes, the encrypted pairs and encrypts them again in pairs. This repeats until there is only 1 hash left. This hash is the root hash. We are able to take a big length array of addreses who are shitelisted, compute the root hash off-chain using Javascript , and then insert it in the smart contract. The benefit comes when we have to find if someone is whitelisted in a big mess of data. Using a 80 addreses array it would cost us someweher between 100 and 300 gas units to loop through all the addreses to check it, whereas using the merkle proof only about 50. That means 2 to 6 times cheaper. 


## Getting started
```shell
npx hardhat run scripts/main.js
```

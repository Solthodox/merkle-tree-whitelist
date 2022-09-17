const { MerkleTree } = require('merkletreejs')
const keccak256 = require('keccak256');
const hre = require("hardhat")

exports.getMerkleRootOfAddresses = async function(){
    console.log("Generating merkle tree root hash...")
    const accounts = await hre.ethers.getSigners()
    const addresses  = accounts.slice(0,8).map(a=>a.address)

    const tree = new MerkleTree(addresses, keccak256, { hashLeaves: true, sortPairs: true  })
    console.log("Merkle tree generated : ", tree)

    const root = tree.getRoot().toString('hex')
    console.log("HASH ROOT:" , root)

    const leaf = keccak256(addresses[7])

    const proof = tree.getHexProof(leaf)

    console.log("Proof :" , proof)



    return root
}
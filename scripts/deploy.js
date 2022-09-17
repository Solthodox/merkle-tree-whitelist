
const hre = require("hardhat");

exports.Deploy = async function (hashRoot) {
  const nft = await hre.ethers.getContractFactory("NFT")
  const Nft = await nft.deploy()
  // Inserting all the whitelisted users with a simple transaction
  const tx = await Nft.setHashRoot(hashRoot)
  await tx.wait()
}


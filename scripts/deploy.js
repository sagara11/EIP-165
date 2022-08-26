// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Selector = await hre.ethers.getContractFactory("Selector");
  const selector = await Selector.deploy();

  await selector.deployed();

  console.log("Selector is deployed at:", selector.address);
  console.log(await selector.calcStoreInterfaceId());

  const Store = await hre.ethers.getContractFactory("Store");
  const store = await Store.deploy();

  await store.deployed();
  console.log("Store is deployed at:", store.address);

  await store.setValue(511);

  const StoreReader = await hre.ethers.getContractFactory("StoreReader");
  const storeReader = await StoreReader.deploy(store.address);

  await storeReader.deployed();
  console.log("StoreReader is deployed at:", storeReader.address);

  console.log(await storeReader.readStoreValue());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

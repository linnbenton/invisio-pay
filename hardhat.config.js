require("hardhat-deploy");
require("fhenix-hardhat-plugin");
require("dotenv").config();

const PRIVATE_KEY = process.env.PRIVATE_KEY || "";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      evmVersion: "cancun",
    },
  },
  networks: {
    // Jaringan Resmi Fhenix Helium Testnet
    helium: {
      url: "https://api.helium.fhenix.zone",
      accounts: PRIVATE_KEY !== "" ? [PRIVATE_KEY] : [],
      chainId: 8008135,
    },
  },
  namedAccounts: {
    deployer: {
      default: 0,
    },
  },
};

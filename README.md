# 💼 InvisioPay

### Compliant Private Payroll & Contractor Milestone Hub

Built for **Privacy-by-Design dApp Buildathon (Fhenix × Privara)**

---

## 🌌 Overview

**InvisioPay** is a privacy-native payroll and contractor milestone management hub built on top of **Fhenix Fully Homomorphic Encryption (FHE)** and integrated conceptually with **Privara SDK** compliant payment rails.

Most Web3 payroll and corporate treasury operations suffer from default transparency, exposing corporate financial strategies, employee salaries, and contractor performance scores to front-runners (MEV) and public surveillance. InvisioPay treats confidentiality as a foundational primitive—encrypting financial workflows _client-side_ before they ever touch the blockchain.

## 🛠️ Core Architecture & Features

- **Privacy-Native State Variables:** Uses Fhenix encrypted types (`euint32` and `euint8`) to securely store contract budgets and milestone targets.
- **On-Chain Encrypted Computations:** Contractor performance evaluations are assessed homomorphically using `FHE.gte` entirely inside the encrypted state, mitigating MEV front-running and parameter snooping.
- **Regulatory Compliance Checkmarks:** Ready for application-layer anchoring with `@reineira-os/sdk` to execute confidential but fully legal stablecoin payouts with zero-knowledge audit trails (_Selective Disclosure_).

---

## 💻 Technical Specification & Implementation

### Smart Contract

The core logic resides in `contracts/InvisioPay.sol`:

- `createMilestone()`: Initiates a confidential contractor hub with encrypted budgets.
- `verifyAndRelease()`: Compares actual performance metrics against targets using FHE logic and triggers autonomous fund routing upon encrypted validation.

### Compilation Target

Optimized and compiled successfully using the Hardhat runtime environment:

- **Solidity Version:** `0.8.24`
- **EVM Target Version:** `cancun` (leveraging advanced cryptographic opcodes)
- **Plugin Auditing:** Evaluated via `fhenix-hardhat-plugin` (**0 exposed encrypted variables detected**).

---

## 🚀 Local Deployment Guide

### Prerequisites

Ensure you have Node.js installed.

### Installation

```bash
npm install
```

### Compile Smart Contracts

```bash
npx hardhat compile
```

### Local Hardhat Network Deployment

```bash
npx hardhat deploy
```

Expected Mock Contract Deployment Address: 0x5FbDB2315678afecb367f032d93F642f64180aa3

## 🗺️ Roadmap

Wave 5: Full frontend integration utilizing @cofhe/react hooks (useEncrypt, useWrite, useDecrypt) and the cryptographic Permit system for selective dashboard access.

Wave 6: Automated enterprise reporting ledger implementation for compliance audits using Privara prebuilt compliant payment patterns.

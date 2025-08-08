# 🏞️ VirtualLandNFT - Aptos Move Module

## Overview
`VirtualLandNFT` is a Move smart contract for the Aptos blockchain that enables creators to:
- Create their own **virtual land NFT collection**
- Mint unique **land plot NFTs**

It uses Aptos' **`token_v1`** standard for NFT creation and management.

---

## 📂 Features
- **One Collection per Creator** – Ensures each account can only create one `LandCollection`.
- **Unlimited Supply Collection** – No cap on number of tokens in the collection.
- **Customizable Metadata** – Each NFT can have its own name, description, and URI.

---

## 🛠 Functions

### `create_collection`
Creates a new NFT collection for virtual land plots.

**Signature:**
```move
public fun create_collection(
    creator: &signer,
    name: vector<u8>,
    desc: vector<u8>,
    uri: vector<u8>
)

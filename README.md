## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

[ETHERSCAN_API_KEY](https://etherscan.io/myapikey)

Deploy and Verify

```
forge create --rpc-url URL --private-key PVT_KEY src/PriceConverter.sol:PriceConverter

forge verify-contract 0xf740c40aEb933d5F05Fe119dd82f450c8228BFC9 src/PriceConverter.sol:PriceConverter  --verifier etherscan --chain 5

forge create --rpc-url URL --private-key PVT_KEY src/FundMe.sol:FundMe --libraries src/PriceConverter.sol:PriceConverter:0xf740c40aEb933d5F05Fe119dd82f450c8228BFC9

forge verify-contract 0x6765eb1Fd06748bCCf6cad16B0c358a14BbFa058 src/FundMe.sol:FundMe  --verifier etherscan --chain 5
```

# EBSI Ethereum Network

A jumpstart implementation of the EBSI node infrastructure for Hyperledger Besu.

## Bootstrapping the network

This has to be done only once in order to bootstrap the network. Once this is done, the same material can be used for the same network.

In order to create the artifacts needed for a core network with 4 Consensus nodes, follow these steps:

### 1. Modify the configuration file in ./ebsi-core-net

The file [./ebsi-core-net/ibftConfigFile.json](./ebsi-core-net/ibftConfigFile.json) contains the definitions to generate a genesis.json file and a number of starting Consensus nodes. You can look at the file and modify it accordingly.

### 2. Create the Genesis File and the public/private keys for each node

Run the bash command generateConfigFile.sh. This command will use `besu operator generate-blockchain-config` to generate in the `net-definitions` directory the following:

* genesis.json - genesis file including the extraData property specifying the four nodes are validators
* One directory for each node named with the node address and containing the public and private key for each node

### 3. Copy the Genesis File to the ebsi-core-net directory

Copy the genesis.json file to the `ebsi-core-net` directory.

### 4. 5. Copy Node Private Keys to Node Directories

For each node, copy the key files from the `net-definitions` directory to the `data` directory for that node in the `ebsi-core-net` directory, as shown in the following figure.

```
ebsi-core-net/
├── genesis.json
├── Node-1
│   ├── data
│   │    ├── key
│   │    ├── key.pub
├── Node-2
│   ├── data
│   │    ├── key
│   │    ├── key.pub
├── Node-3
│   ├── data
│   │    ├── key
│   │    ├── key.pub
├── Node-4
│   ├── data
│   │    ├── key
│   │    ├── key.pub
```

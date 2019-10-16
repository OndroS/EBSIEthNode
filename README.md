# EBSI Ethereum Network

A jumpstart implementation of the EBSI node infrastructure for Hyperledger Besu.

## Bootstrapping the network

This has to be done only once in order to bootstrap the network. Once this is done, the same material can be used for the same network.

In order to create the artifacts needed for a core network with 4 Consensus nodes, follow these steps:

### 1. Modify the network configuration file (ibftConfigFile.json)

The file [./ibftConfigFile.json](./ibftConfigFile.json) contains the definitions to generate a genesis.json file and a number of starting Consensus nodes. You can look at the file and modify it accordingly.

### 2. Create the Genesis File and the public/private keys for each node

Run the bash command generateConfigFile.sh. This command will use `besu operator generate-blockchain-config` to generate in the `net-definitions` directory the following:

* **genesis.json** - genesis file including the extraData property specifying the four nodes are validators
* One directory for each node named with the node address and containing the public and private key for each node

### 3. Copy the Genesis File to the ebsi-core-net directory

Copy the `genesis.json` file to the `ebsi-core-net` directory.

### 4. Copy Node Private Keys to Node Directories

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
### 5. Update the node config file (config.toml) with the list of bootnodes

While the network is small, for simplicity we are going to use the Consensus nodes also as Bootnodes.

We have to create an entry in the `.config.toml`configuration file to define the boot nodes. In order to do so, create a line like the following:

```
bootnodes=[
    "enode://pubkey1@ip1:port1",
    "enode://pubkey2@ip2:port2",
    "enode://pubkey3@ip3:port3",
    "enode://pubkey4@ip4:port4"
]
```

Where:

* **pubkey1, pubkey2, pubkey3 and pubkey4** correspond to the corresponding contents of the file `key.pub`in the `data` directory of each node in the `ebsi-core-net` directory.

* **ip1, ip2, ip3 and ip4** correspond to the external IP addresses of each machine where the EBSI nodes are running.

* **port1, port2, port3 and port4** correspond to the ports used for the P2P protocol in each of the EBSI machines. Normally, they are the same and the port is 30303. However, any suitable port could be used.

### 6. Copy the config.toml to each node and update it

The `config.toml` file specifies the behaviour of the Besu binary when started. All Consensus nodes in the core network have the same configuration file, except the definition of the external IP on which they wil be listening. Due to NAT problems in AWS virtual machines, we can not use automatic discovery and have to specify external IPs in the configuration file of each node individually. So the process is the following:

1. Copy the `config.toml` file to each of the node directories in the `ebsi-core-net` directory

2. Modify each of the `config.toml` files en each node directory so the entry `p2p-host="x.x.x.x"` has the proper IP address.

### 7. Start the network

In order to start the network, we have to copy the whole contents of the repository to each of the machines which will run the EBSI nodes (in principle it would be enough to copy just the data corresponding to each node, but for simplicity we copy everything).

In each node, execute the `./start.sh` script passing as parameter the name of the directory where the node config data is stored. For example:

```
./start.sh Node-1
```

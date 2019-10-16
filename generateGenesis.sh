#!/bin/bash -u

# Initialize the EBSI network configuration.
# It does not start anything, but generates the genesis file, and the node addresses.
# WARNING: each time it runs it overwrites the previous configuration.



# docker-compose run besuplain operator generate-blockchain-config --config-file=/root/ebsi-core-net/ibftConfigFile.json --to=/root/net-definitions --private-key-file-name=key

# Erase directory where genesis file and node keys are going to be generated
rm -rf net-definitions

# Run the Besu binary with the subcommand 'operator' to generate the blockchain configuration
docker-compose run -v `pwd`:`pwd` -w `pwd` besuplain operator generate-blockchain-config \
  --config-file=./ibftConfigFile.json \
  --to=./net-definitions \
  --private-key-file-name=key

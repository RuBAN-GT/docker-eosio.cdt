# Docker for EOSIO.CDT

Image with EOSIO.CDT for building EOSIO contracts

## How to build

```bash
docker build . -t eosio.cdt -f ./Dockerfile
```

## Example of running

```bash
docker run --name eos-contracts -id -v REAL_CONTRACTS_PATH:/contracts eosio.cdt
```

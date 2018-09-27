FROM ubuntu:18.04

LABEL author="ruban0v <dkruban@gmail.com>" \
      maintainer="RuBAN-GT <dkruban@gmail.com>" \
      description="Image with EOSIO.CDT for building EOSIO contracts"

ARG branch=master
ARG cdt_path=/opt/eosio.cdt
ARG symbol=SYS

# Common dependencies
RUN apt-get update && apt-get install sudo git cmake -y

# Load and build project
RUN git clone -b $branch --recursive https://github.com/eosio/eosio.cdt $cdt_path

WORKDIR ${cdt_path}
RUN echo 1 | ./build.sh $symbol
RUN ./install.sh

# Prepare contracts volume
RUN mkdir /contracts
WORKDIR /contracts

VOLUME ["/contracts"]

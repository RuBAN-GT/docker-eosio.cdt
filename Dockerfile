FROM eosio/builder

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

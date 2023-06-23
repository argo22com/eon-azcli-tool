# eon-azcli-tool

## Introduction

Dockerized client for Azure Bastion

## Dependencies

* docker
* docker-compose
* ~~[net-tols package](https://packages.debian.org/bullseye/net-tools) to be able to use `route` tool~~ (not ready as of now)
* make

## How to

* Define "server" tunnels for IP and ports within `.env` file. See `.env.sample` for an example
* Each environment variable name consists of `{resource-tunnel-name}_{az-network-bastion-tunnel_arg_id}`. The `{resource-tunnel-name}` is used for tunnel control so make it memorable
* To make a connection to defined resources, run `make` from host. It then builds docker image and spawns a container for it.
* Then to be able to control tunnels, connect to the container itself, via `make cli`
* Then, from within the docker container run `./init`. It should suffice to run it once for a given session (`az login` validity).
    - The [init script](./script/init) calls for login, then installs bastion extension and finally patches it for it to be able to be used from the outside.
* Now you are all set and you can run the tunnel script: `./tunnel start {resource-tunnel-name}` to start the tunnel (repeatedly for more resources) or `./tunnel stop {resource-tunnel-name}` to stop it.
* For now it is necessary to explicitly define ports to expose on host. There is an intention to make this automatic. Not ready yet though. Just set these in [docker-compose.override.yml](./docker-compose.override.sample.yml)

## TODOs

* ~~Setup and test DB connectivity via bastion~~ works OK w/o a need for any configuration on the container side
* Setup and test integration API via bastion
* Automatic port exposition to a host
* Once bastion script [is fixed](https://github.com/Azure/azure-cli-extensions/issues/4568), patching the library will no longer be necessary and can be dropped.

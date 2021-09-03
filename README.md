# Fluree ledger docker-compose example

This project provides an example of how to serve Fluree instances in Docker
containers using docker compose.

## Get Started

Clone or download this repository onto your machine.

```bash
git clone https://github.com/fluree/ledger-docker-compose-example.git

cd ledger-docker-compose-example
```

## Single-Node Fluree

If you want to run Fluree as a single, centralized server, you can do so by
just running `docker compose up` in the directory where you cloned this
repo.

Navigate to [`https://localhost:8090/`](https://localhost:8090/) to see the administrative user interface.

## Multi-Node Fluree

> Note: Docker Desktop RAM defaults may be too low for running Fluree in a multi-node
> configuration locally. We generally recommend 2-3GB of RAM per node, so for this example,
> 8GB should suffice.  

To run a Fluree network with three servers, simply issue: `docker compose -f docker-compose.cluster.yml up`.

If you want to run a network with a different number of servers, you can edit the
`docker compose.cluster.yml` file to include more servers.

> It is recommended to only run 3 or 5 node clusters. Due to the
way the raft consensus protocol works running 2, 4, or 6-node (or larger)
clusters either adds no additional redundancy or introduces more overhead
than it is worth.

## Customizing Fluree

Both the single-node and multi-node configurations of Fluree will work
without changing any of the configurations. However, if you want to change
any of the node's configurations, you can do so by passing in environment
variables.

Information regarding configurable Fluree settings is available online. The
[`Getting Started -> Installation`](https://docs.flur.ee/docs/1.0.0/getting-started/installation) section provides insight on installing
and customizing Fluree .

## Verify container

The Docker Dashboard is useful to verify/access the container and fluree
service. Via the dashboard, you can inspect environment settings, review
logs, open a CLI terminal session and even browse to the Fluree Admin UI
site.

If you are a command-line aficionado, the following commands are useful to verify that your Fluree service is up and running:

---

**command**: `docker ps`

| CONTAINER ID | IMAGE                | COMMAND                | CREATED       | STATUS       | PORTS                            | NAMES   |
| ------------ | -------------------- | ---------------------- | ------------- | ------------ | -------------------------------- | ------- |
| be006b7c70ec | fluree/ledger:latest | "/usr/local/fluree/f…" | 2 minutes ago | Up 2 minutes | 0.0.0.0:8080->8080/tcp, 9790/tcp | fluree1 |

---

## License

This project is licensed under the terms of the MIT license.

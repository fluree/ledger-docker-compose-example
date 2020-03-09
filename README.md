# fluree-docker-example

This project provides an example of how to serve Fluree instance in a Docker container.

## Get Started

1. Clone or download this repository onto your machine.

```
git clone https://github.com/fluree/fluree-docker-example.git

cd fluree-docker-example
```

2. Download your preferred version of Fluree and move those files into a `fluree/` folder in the `fluree-docker-example-folder`. 

This repository does not include a distribution of Fluree. You can download:

- The latest stable version: https://fluree-releases-public.s3.amazonaws.com/fluree-stable.zip
- The latest version: https://fluree-releases-public.s3.amazonaws.com/fluree-latest.zip


```
(this is an example. This may be different depending on your operating system on the Fluree version you download).

wget https://fluree-releases-public.s3.amazonaws.com/fluree-stable.zip

unzip fluree-stable.zip

mv fluree-0.12.1/ fluree/
```

When you finish with this step, your directory should contain the following items:

```
.
├── Dockerfile
├── LICENSE
├── README.md
├── docker-compose.override.yml
├── docker-compose.yml
└── fluree
    ├── CHANGELOG.md
    ├── LICENSE
    ├── VERSION
    ├── fluree_sample.properties
    ├── fluree_server.jar
    └── fluree_start.sh
```

3. Execute `docker-compose build` to build.

#### Single-Node Fluree

If you want to run Fluree as a single, centralized server, you can do so by going to `docker-compose.override.yml` and commenting out everything below the line that says `# comment out the below services to run a single-node Fluree network`.

You can then start Fluree by issuing `docker-compose up` in your terminal.

Navigate to `http://localhost:8080/` to see the administrative user interface. 

#### Multi-Node Fluree

To run a Fluree network with three servers, simply issue: `docker-compose up`. 

If you want to run a network with a different number of servers, you can edit the `docker-compose.override.yml` file to include more servers. 

To add additional servers, you can simply copy any of the other service configurations, and change the relevant options: 

```
  fluree-n4:
    build: 
      context: .
      dockerfile: Dockerfile
    container_name: fluree4
    environment: 
      fdb_group_servers: *group-servers
      fdb_group_this_server: server4
      fdb_api_port: 8083
      fdb_group_port: 9793
    networks:
        - default
    ports:
     - "8083:8083" 
     - "9793:9793"
```

Also, make sure to update, `x-group-servers` to include the new server:

```
x-group-servers:
  &group-servers
  server1@host.docker.internal:9790,server2@host.docker.internal:9791,server3@host.docker.internal:9792,server4@host.docker.internal:9793
```

#### Customizing Fluree 
Both the single-node and multi-node configurations of Fluree will work without changing any of the configurations. However, if you want change any of the node's configurations, you can do so by passing in environment variables. 

Information regarding configurable Fluree settings is available online. The `Getting Started -> Installation` section provides insight on installing and customizing Fluree (https://docs.flur.ee/docs/getting-started/installation).

You can do this by adding to the `environment` section for a given service in the `docker-compose.override.yml` file. 

For example, in the below

```
  fluree-n1:
    build: 
      context: .
      dockerfile: Dockerfile
    container_name: fluree1
    environment: 
      fdb_group_servers: *group-servers
      fdb_group_this_server: server1
      fdb_api_port: 8080
      fdb_group_port: 9790
      fdb-group-private-key: abc123
    networks:
        - default
    ports:
     - "8080:8080" 
     - "9790:9790"
```

## Verify container
The Docker Dashboard is useful to verify/access the container and fluree service.  Via the dashboard, you can inspect environment settings, review logs, open a CLI terminal session and even browse to the Fluree Admin UI site.

If you are a command-line aficionado, the following commands are useful to verify that your Fluree service is up and running:
&nbsp;

---
**command**: `docker container ls`

| CONTAINER ID | IMAGE | COMMAND | CREATED | STATUS | PORTS | NAMES |
| -- | -- | -- | -- | -- | -- | -- |
| be006b7c70ec | fluree:latest | "/usr/local/fluree/f…" | 2 minutes ago | Up 2 minutes | 0.0.0.0:8080->8080/tcp, 9790/tcp | fluree1 |

---
**command**: `docker exec -it fluree1 bash -c 'curl http://localhost:8080'`

```
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"><meta name="theme-color" content="#000000"><link rel="manifest" href="/manifest.json"><link rel="shortcut icon" href="/favicon.ico"><link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"><link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png"><link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"><title>FlureeDB Admin Console | Flur.ee</title><link rel="stylesheet" href="/prism.css"><link rel="stylesheet" href="/font-awesome.css"><script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script><link href="/static/css/main.be82eb37.css" rel="stylesheet"></head><body style="height:100%"><noscript>You need to enable JavaScript to run this app.</noscript><div id="fluree-app" style="height:100%"></div><script src="/prism.js" async></script><script type="text/javascript" src="/static/js/main.8ca02ec1.js"></script></body></html>
```
&nbsp;

Docker CLI documentation is also available online at https://docs.docker.com/engine/reference/commandline/cli/.    

## License
This project is licensed under the terms of the MIT license.
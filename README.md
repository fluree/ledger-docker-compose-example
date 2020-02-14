# fluree-docker-example

## Docker container image build for Fluree Community Edition

This project provides an example of how to serve a stand-alone Fluree instance in a Docker container.

**Note**: *This project does not include a distribution of Fluree.  You can download the latest distribution of Fluree Community Edition from https://flur.ee*
&nbsp;
   

---
#### Customizing Fluree 
The project configuration works with fluree 'out-of-the-box'.  However, every Fluree configuration setting can be overridden using environment variables.  Docker allows you to override the default container definition at run-time using its command-line interfaces (CLIs).  

Assuming that 'fluree' is the name of the container service, some examples of run-time overrides are:

- setting the private-key for the ledger group:

    `docker run -e FDB-GROUP-PRIVATE-KEY=abc123 fluree`

- setting up a server farm and identifying the current server:
    
    `docker run -e FDB-GROUP-SERVERS="server1@localhost:9790;server2@localhost:9790;server3@localhost:9790" -e FDB-GROUP-THIS-SERVER=server1 fluree`

- setting the api port and configuring a closed api:

    `docker run -e FDB-API-PORT=8090 -e FDB-API-OPEN=false -p 8090:8090/tcp fluree`   
&nbsp;

#### For More Information
Information regarding configurable Fluree settings is available online. The `Getting Started -> Installation` section provides insight on installing and customizing Fluree (https://docs.flur.ee/docs/getting-started/installation).

Docker CLI documentation is also available online at https://docs.docker.com/engine/reference/commandline/cli/.    

&nbsp;

---
## First time build steps

1. Clone / download the files from this project into a local directory.  Do not download into the root directory.  

2. Create a "fluree" subdirectory in the same directory as the files (downloaded) for this project.

3. Download Fluree from https://flur.ee 

4. Extract the contents of the downloaded archive, either "fluree-#.#.#" or "fluree-latest", into the "fluree" folder (created in step 2).

5. Open a command line/terminal session.  Change to project directory  (created in step 1).  

6. Execute `docker-compose build`

7. Execute `docker-compose run --name fluree1 --service-ports fluree`

8. Browse to "http://localhost:8080" on the container host machine to get to the Fluree Admin UI.  
&nbsp;

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

## License
This project is licensed under the terms of the MIT license.
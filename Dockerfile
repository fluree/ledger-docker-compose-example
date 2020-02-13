FROM openjdk:8 AS Fluree
LABEL Description="Fluree Community Edition - Docker Image"
LABEL version="1.0"
LABEL maintainer="flureeadmin@flur.ee"
ADD fluree/* /usr/local/fluree/

ENV fdb-group-private-key-file "/opt/fluree/default_private_key.txt"
VOLUME /opt/fluree /opt/fluree

ENTRYPOINT ["/usr/local/fluree/fluree_start.sh"]
EXPOSE 8080
EXPOSE 9790

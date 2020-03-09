FROM openjdk:8 AS Fluree
LABEL Description="Fluree Community Edition - Docker Image"
LABEL version="1.1"
LABEL maintainer="flureeadmin@flur.ee"
COPY fluree/* /usr/local/fluree/

ENV fdb_group_servers ${fdb_group_servers}
ENV fdb_group_this_server ${fdb_group_this_server}
ENV fdb_api_port ${fdb_api_port}

VOLUME /opt/fluree /opt/fluree

ENTRYPOINT ["/usr/local/fluree/fluree_start.sh"]
EXPOSE ${fdb_api_port}
EXPOSE ${fdb_group_port}

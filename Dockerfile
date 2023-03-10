# Download ontotext/graphdb
FROM ontotext/graphdb:10.1.5
MAINTAINER IBD Grupo 2

# Contains .ttl files in the directory /root/graphdb-import
RUN mkdir /root/graphdb-import
WORKDIR /root/graphdb-import

RUN curl -O -L https://datos.iepnb.es/datasets/incendios-forestales.tgz

RUN tar zxvf incendios-forestales.tgz
RUN mv incendios-forestales/ /root/graphdb-import/.
# Expose port 7200
EXPOSE 7200
# Download ontotext/graphdb
FROM ontotext/graphdb:10.1.5

# Contains .ttl files in the directory /root/graphdb-import
COPY ./graphdb-import /root/graphdb-import

# Expose port 7200
EXPOSE 7200
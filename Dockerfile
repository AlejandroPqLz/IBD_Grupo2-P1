# From dockerhub.com pull the image of GraphDB
FROM ontotext/graphdb:10.1.5

# Contact information
MAINTAINER IBD_P1_G2 

# Create a directory to store the data 
RUN mkdir /root/graphdb-import

# Set the working directory
WORKDIR /root/graphdb-import

# Download the data
RUN curl -O -L https://datos.iepnb.es/datasets/incendios-forestales.tgz

# Unzip the data
RUN tar zxvf incendios-forestales.tgz

# Move the data to the directory /root/graphdb-import
RUN mv incendios-forestales/ /root/graphdb import/.

# Expose port 7200
EXPOSE 7200
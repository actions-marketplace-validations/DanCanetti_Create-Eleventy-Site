# Container image that runs your code
FROM ubuntu:latest

# Run node install
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN apt-get -y install build-essential
RUN mkdir eleventy-site
RUN cd eleventy-site
RUN npm install @11ty/eleventy

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY eleventy-site /eleventy-site
COPY create.sh /create.sh

# Code file to execute when the docker container starts up
ENTRYPOINT ["/create.sh"]

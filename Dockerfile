FROM node:latest
MAINTAINER Mariya Snow <mariyavsnow@gmail.com>
USER root

RUN apt-get update -y && apt-get install git -y
RUN npm install -g gulp bower

# Get polymer and polyfill deps
RUN mkdir /polymer
COPY app /polymer/
RUN cd /polymer && bower install --allow-root --save Polymer/polymer#^1.1.0 
RUN cd /polymer && bower install --allow-root --save webcomponentsjs

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /polymer

EXPOSE 8080
CMD /usr/bin/python -m SimpleHTTPServer 8080

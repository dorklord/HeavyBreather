FROM node:latest
MAINTAINER Mariya Snow <mariyavsnow@gmail.com>

RUN apt-get update -y && apt-get install git emacs vim -y

RUN npm install -g gulp bower

RUN mkdir -p /opt/polymer

RUN git clone https://github.com/polymerelements/polymer-starter-kit.git /opt/polymer
RUN npm install /opt/polymer
RUN echo "Y" | bower install --allow-root install /opt/polymer

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/polymer/app

EXPOSE 8080
CMD /usr/bin/python -m SimpleHTTPServer 8080

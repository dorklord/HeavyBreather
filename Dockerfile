FROM irwinfv/polymer-basics:latest
MAINTAINER Mariya Snow <mariyavsnow@gmail.com>
USER root

RUN apt-get update -y && apt-get install emacs -y

# Get polymer and polyfill deps
COPY app /polymer/

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /polymer

EXPOSE 8080
CMD /usr/bin/python -m SimpleHTTPServer 8080

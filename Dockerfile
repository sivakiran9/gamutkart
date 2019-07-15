#!/bin/sh -xe
FROM tomcat:7.0
RUN apt-get update
RUN apt-get install -y vim
COPY target/gamutkart.war /usr/local/tomcat/webapps
ENTRYPOINT /usr/local/tomcat/bin/startup.sh && bash

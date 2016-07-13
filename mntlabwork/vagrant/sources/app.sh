#!/bin/bash
sudo yum install -y java
cd /tmp/
sudo wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz 
sudo tar xaf apache-tomcat-8.5.3.tar.gz
sudo mv apache-tomcat-8.5.3 /usr/local/tomcat8
sudo sh /usr/local/tomcat8/bin/startup.sh


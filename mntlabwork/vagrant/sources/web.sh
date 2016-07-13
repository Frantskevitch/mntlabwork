#!/bin/bash
yum install -y httpd
yum install -y httpd-devel apr apr-devel apr-util apr-util-devel gcc gcc-c++ make autoconf libtool
mkdir -p /opt/mod_jk/
cd /opt/mod_jk
wget http://www.eu.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.41-src.tar.gz
tar -xvzf tomcat-connectors-1.2.41-src.tar.gz
cd tomcat-connectors-1.2.41-src/native
./configure --with-apxs=/usr/sbin/apxs
make
libtool --finish /usr/lib64/httpd/modules
make install
mkdir -p /var/run/mod_jk
chown apache:apache /var/run/mod_jk
sudo cp /tmp/vhost.conf /etc/httpd/conf.d
sudo cp /tmp/worker.properties /etc/httpd/conf
service httpd start



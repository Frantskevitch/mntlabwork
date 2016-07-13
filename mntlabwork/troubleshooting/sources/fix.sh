#!/bin/bash
#remove unwanted redirect
sed -i '/^<VirtualHost/,/^<\/VirtualHost>/{d}' /etc/httpd/conf/httpd.conf
sed -i 's/mntlab/*/' /etc/httpd/conf.d/vhost.conf
#comment missing varibles
sed -i 's/export/#export/' /home/tomcat/.bashrc
#fix missing rights
chown -R tomcat:tomcat /opt/apache/tomcat/current/logs/
#changing java version
alternatives --config java <<< '1'
#editing workers configuration
sed -i 's/worker-jk@ppname/tomcat.worker/' /etc/httpd/conf.d/workers.properties
sed -i 's/192.168.56.100/192.168.56.10/' /etc/httpd/conf.d/workers.properties
#iptables fix
chattr -i /etc/sysconfig/iptables
	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	iptables -A INPUT -p tcp --dport 80 -j ACCEPT
	iptables -A INPUT -p tcp --dport 22 -j ACCEPT
	service iptables save
	service iptables restart
chattr +i /etc/sysconfig/iptables
#turning on tomcat autorun
chkconfig tomcat on
#starting servers
service tomcat start
service httpd restart

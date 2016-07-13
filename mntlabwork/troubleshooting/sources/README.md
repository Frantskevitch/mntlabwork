| №   | Issue                                        | How to find                            | Time to find  | How to fix                                              | Time to fix |
|-----|----------------------------------------------|----------------------------------------|---------------|---------------------------------------------------------|-------------|
| 1   | HTTP/1.1 503 Service Temporarily Unavailable | Curl -IL 192.168.56.10                 | 10m           | Steps 1.2, 1.3 2                                        | 2h          |
| 1.2 | worker.properties file missconfig            | Curl -IL 192.168.56.10                 | 5m            | Change workers names and ip adress                      | 10m         |
| 1.3 | httpd.conf missconfig                        | Read configuration                     | 5m            | Delete unwanted redirect                                | 5m          |
| 2   | Tomcat unavailable                           | Ps -ef  grep tomcat                   | 20m           | Change logs permissions(step 2.2),repair java(step 2.1) | 1h          |
| 2.1 | Bad ELF interpreter                          | Java -version                          | 20m           | alternatives --config java                              | 10m         |
| 2.2 | Tomcat user rights                           | Ls -la /opt/apache/tomcat/current/logs | 15m           | Chown tomcat:tomcat                                     | 15m         |
| 3   | Iptables inactive                            | iptables -L -n                         | 15m           | Change configuration                                    | 1h          |
| 3.1 | Iptables lock                                | Try to change iptable                  |               | chattr -i /etc/sysconfig/iptables                       | 30m         |  

###1. What java version is installed?  
type "alternatives --config java" to check  
java x64 jdk1.7.0_79  
java i586 jdk1.7.0_79
###2. How was it installed and configured?
Java is installed using alternatives
###3. Where are log files of tomcat and httpd?
httpd logs: /etc/httpd/logs/error_log
tomcat logs 
###4. Where is JAVA_HOME and what is it?  
JAVA_HOME variable points to the directory where the java runtime environment is installed
###5. Where is tomcat installed?  
/opt/apache/tomcat/current and  
/opt/apache/tomcat/7.0.62
###6. What is CATALINA_HOME?  
CATALINA_HOME is the folder where Apache Tomcat is installed.  
###7. What users run httpd and tomcat processes? How is it configured?
tomcat run under tomcat user, it is configured in the file /etc/init.d/tomcat.  
su - tomcat -c "sh /opt/apache/tomcat//current/bin/startup.sh"
httpd run under apache user, it is configured in the httpd.conf file.  
User apache  
Group apache  
###8. What configuration files are used to make components work with each other?
worker.properties file - contain workers configuration  
vhost.conf file - contain redirect rules
###9. What does it mean: “load average: 1.18, 0.95, 0.83”?  
The load average represents the average system load over a period of time.  
It conventionally appears in the form of three numbers which represent the system load  
during the last 1, 5, and 15-minute periods.
An idle computer has a load number of 0.  
Each process using or waiting for CPU increments the load number by 1.

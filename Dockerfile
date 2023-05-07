FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install java-11-openjdk-devel -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.tar.gz .
RUN tar -xvzf apache-tomcat-10.1.8.tar.gz
RUN mv apache-tomcat-10.1.8/* /opt/tomcat/.
EXPOSE 8080
COPY ./WebSocketServer.war /opt/tomcatwebapps
CMD ["/opt/tomcat/bin/catalina.sh","run"]
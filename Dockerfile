FROM centos:latest
ENV MIRROR_URL=http://vault.centos.org \
    TOMCAT_VERSION=10.1.8
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
 && sed -i "s|#baseurl=http://mirror.centos.org|baseurl=$MIRROR_URL|g" /etc/yum.repos.d/CentOS-*
RUN yum install java-11-openjdk-devel -y\
 && mkdir /opt/tomcat \
 && cd /opt/tomcat \
 && curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
 && tar -xvzf apache-tomcat-$TOMCAT_VERSION.tar.gz --strip-components=1 \
 && rm apache-tomcat-$TOMCAT_VERSION.tar.gz
WORKDIR /opt/tomcat
EXPOSE 8080
ENV WEB_APP_PATH=/opt/tomcat/webapps/WebSocketServer.war
COPY ./WebSocketServer.war $WEB_APP_PATH
CMD ["./bin/catalina.sh", "run"]

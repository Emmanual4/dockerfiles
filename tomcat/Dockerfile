FROM emmanual4/java:latest
MAINTAINER emmanual

RUN apt-get -y install wget
RUN wget --quiet --no-cookies https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /tmp && \
cp -Rf /tmp/apache-tomcat-9.0.12 /home/tomcat1 && \
sed -i -e 's/\(<Server[ ]*\)\(port=\"[0-9]*\"\)\([ ]*shutdown=\"SH.*\)/\1port="8010"\3/'  /home/tomcat1/conf/server.xml && \
sed -i -e 's/\(<Connector[ ]*\)\(port=\"[0-9]*\"\)\([ ]*protocol=\"org.*\)/\1port="8046"\3/'  /home/tomcat1/conf/server.xml && \
sed -i -e 's/\(<Connector[ ]*\)\(port=\"[0-9]*\"\)\([ ]*protocol=\"HTTP.*\)/\1port="8081"\3/'  /home/tomcat1/conf/server.xml && \
sed -i -e 's/\(<Connector[ ]*\)\(port=\"[0-9]*\"\)\([ ]*protocol=\"AJP.*\)/\1port="8018"\3/'  /home/tomcat1/conf/server.xml 

EXPOSE 8081 

# Launch Tomcat
CMD ["/home/tomcat1/bin/catalina.sh","run"]


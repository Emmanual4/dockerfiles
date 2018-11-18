FROM ubuntu:latest
# Configure ubuntu



ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8
RUN apt-get update && apt-get install -y gnupg

RUN apt-get update && \
  apt-get install -y --no-install-recommends locales && \
  locale-gen en_US.UTF-8 && \
  apt-get dist-upgrade -y && \
  apt-get --purge remove openjdk* && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
  apt-get clean all
RUN apt-get -y install wget
# Download and start neo4j
RUN mkdir /soft
WORKDIR /soft
RUN wget http://dist.neo4j.org/neo4j-community-2.2.1-unix.tar.gz
RUN tar zxvf neo4j-community-2.2.1-unix.tar.gz
RUN ln -s /soft/neo4j-community-2.2.1 /soft/neo4j

# Configure host access
RUN sed -i "s|#org.neo4j.server.webserver.address=0.0.0.0|org.neo4j.server.webserver.address=0.0.0.0|g" /soft/neo4j/conf/neo4j-server.properties

# Expose the ports we're interested in
EXPOSE 7474 1337

# Start Neo4j
CMD ["/soft/neo4j/bin/neo4j", "console"]


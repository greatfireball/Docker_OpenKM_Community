FROM ubuntu

MAINTAINER Frank Foerster <openkm_docker@foersterfrank.de>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERSION 7.0.54
ENV JAVA_HOME /usr/local/java
ENV ORACLE_JAVA_HOME /usr/lib/jvm/java-7-oracle/

RUN apt-get update && apt-get install -y software-properties-common

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

RUN ln -s $ORACLE_JAVA_HOME $JAVA_HOME

RUN apt-get -y install libreoffice imagemagick swftools liblog4j1.2-java libgnumail-java ant curl unzip  sudo tar

RUN curl -L https://sourceforge.net/projects/openkm/files/6.3.3/OpenKM-6.3.3.zip/download -o /usr/local/openkm-tomcat-bundle.zip && \
    unzip /usr/local/openkm-tomcat-bundle.zip -d /usr/local/ && rm /usr/local/openkm-tomcat-bundle.zip && ln -s $CATALINA_HOME /opt/openkm


ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080 2002

CMD /usr/local/tomcat/bin/catalina.sh run
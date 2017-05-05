FROM ubuntu

MAINTAINER Frank Foerster <openkm_docker@foersterfrank.de>

# add user openkm (password openkmadmin)
RUN useradd --password '$6$d7WGWXVT1$27UG2CfTvKuJTNj4UYzEAxVlLoJ6ia9lRlSIV2nhFpEHqJk0JQfrcrYEmqIdFaNN/IyWWjHC8aBLO1mRDxe3k/' openkm

# install wget gawk pciutils
RUN apt-get update && apt-get install -y wget gawk pciutils && apt-get clean

# download and run inxi
RUN wget -O /tmp/inxi -Nc smxi.org/inxi && chmod +x /tmp/inxi && /tmp/inxi -F

# increase ulimit
RUN sed -i '/#session[[:space:]]*required[[:space:]]*pam_limits.so/s/^#//;' /etc/pam.d/su
RUN sed -i '/# End of file/d' /etc/security/limits.conf && \
    echo "*   soft  nofile   6084" >> /etc/security/limits.conf && \
    echo "*   hard  nofile   6084" >> /etc/security/limits.conf && \
    echo "# End of file" >> /etc/security/limits.conf

# install java 1.8
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre

RUN apt-get -y install libreoffice imagemagick swftools liblog4j1.2-java libgnumail-java ant curl unzip  sudo tar

ENV CATALINA_HOME /usr/local/tomcat/
ENV JAVA_HOME /usr/local/java
ENV OPENJDK_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre/

RUN ln -s $OPENJDK_HOME $JAVA_HOME

CMD /usr/local/tomcat/bin/catalina.sh run


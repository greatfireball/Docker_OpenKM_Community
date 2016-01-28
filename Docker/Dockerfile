FROM ubuntu
MAINTAINER Frank Förster <frank.foerster@uni-wuerzburg.de>

# Update the installation and remove openjdk
RUN apt-get update && apt-get --assume-yes purge openjdk*

# Include java repository
RUN \
	apt-get install --assume-yes software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	apt-get update && \
	apt-get install --assume-yes oracle-java6-installer

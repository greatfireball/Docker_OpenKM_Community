#!/bin/bash

sed -i '/^[[:space:]]*<Resource name="jdbc\/OpenKMDS"/{N;N;N;s/validationQuery="[^"]*"/validationQuery="select 1"/;s/username="[^"]*"/username="'$PG_ENV_DB_USER'"/;s/password="[^"]*"/password="'$PG_ENV_DB_PW'"/;s/driverClassName="org.hsqldb.jdbcDriver"/driverClassName="org.postgresql.Driver"/;s/url="[^"]*"/url="jdbc:postgresql:\/\/'$PG_PORT_5432_TCP_ADDR':'$PG_PORT_5432_TCP_PORT'\/'$PG_ENV_DB_NAME'"/;}' /usr/local/tomcat/conf/server.xml

$TOMCAT_HOME/bin/catalina.sh run

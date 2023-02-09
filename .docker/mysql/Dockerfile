FROM mysql:8
MAINTAINER Dana Negrescu <dana.negrescu@boxalino.com>

# custom dirs for mysql shared docker environments
RUN mkdir -p /mysql-tmp && mkdir -p /mysql-data
RUN chown mysql:mysql /mysql-tmp /mysql-data

# copy mysql config
ADD conf/dev.cnf /etc/mysql/conf.d/dev.cnf
ADD conf/remote-access.cnf /etc/mysql/conf.d/remote-access.cnf

COPY grant.sql /docker-entrypoint-initdb.d/grant.sql

EXPOSE 3306
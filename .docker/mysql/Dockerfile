FROM mysql:8.0.36
MAINTAINER Dana Negrescu <dana.negrescu@boxalino.com>

# copy mysql config
ADD conf/dev.cnf /etc/mysql/conf.d/dev.cnf
ADD conf/remote-access.cnf /etc/mysql/conf.d/remote-access.cnf

RUN chmod 400 /etc/mysql/conf.d/dev.cnf
RUN chmod 400 /etc/mysql/conf.d/remote-access.cnf

COPY grant.sql /docker-entrypoint-initdb.d/grant.sql

EXPOSE 3306

FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/config.sh /config.sh
RUN chmod -x /config.sh
RUN mkdir -p /run/mysqld \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["bash", "/config.sh"]
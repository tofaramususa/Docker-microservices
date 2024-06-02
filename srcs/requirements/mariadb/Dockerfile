FROM debian:11

USER root

RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    gettext

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY ./conf/init_db.sql /var/lib/mysql/init_db.sql
COPY ./conf/config.sh /var/lib/mysql/

RUN chmod +x /var/lib/mysql/config.sh

CMD ["sh", "/var/lib/mysql/config.sh"]


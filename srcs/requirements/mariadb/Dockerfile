FROM alpine:3.19

USER root

RUN apk -i upgrade && apt -i add\
    mariadb-server \
    mariadb-client \

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY ./conf/init_db.sql /var/lib/mysql/init_db.sql
COPY ./conf/config.sh /var/lib/mysql/

RUN chmod +x /var/lib/mysql/config.sh

CMD ["sh", "/var/lib/mysql/config.sh"]


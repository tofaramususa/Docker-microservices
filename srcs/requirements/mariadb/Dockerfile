FROM alpine:3.19

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash mariadb mariadb-client gettext && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /var/lib/mysql /run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

WORKDIR /var/lib/mysql

COPY ./conf/init_db.sql /tmp/init_db.sql

COPY ./tools/setup.sh /tmp/setup.sh
RUN chmod 755 /tmp/setup.sh

EXPOSE 3306

USER mysql

CMD [ "bash", "/tmp/setup.sh"]
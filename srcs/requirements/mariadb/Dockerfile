FROM alpine:3.19

USER root 
# make the user running these commands to be root

RUN apk upgrade --update-cache

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/lib/mysql /run/mysqld
# create two directories and sub directories
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld
# this is to give ownership of the files mysql and mysqld to mysql(user):mysql(group)


COPY ./conf/init_db.sql /var/lib/mysql/init_db.sql
# this is copy the script from sql 

COPY ./conf/config.sh /var/lib/mysql/
# 

RUN chmod +x /var/lib/mysql/config.sh

CMD ["sh", "/var/lib/mysql/config.sh"]


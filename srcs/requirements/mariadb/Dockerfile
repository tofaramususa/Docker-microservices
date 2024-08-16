# base image - will give as the basic file structure and linux runtime invironment and more 
FROM alpine:3.19

# Installing and Updating package repository and Installing neccessay packages for MariaDB server
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash mariadb mariadb-client gettext && \
    rm -rf /var/cache/apk/*

# two directories - first one for storing Dbs, tables and other files, and second one for storing runtime files
RUN mkdir -p /var/lib/mysql /run/mysqld

# security best practice - Principle of Least Privilege
# changing the ownership to one user
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

WORKDIR /var/lib/mysql

# copying our custom conf file, database initial setup script, and our entrypoing to the contianer
COPY ./conf/db_setup.sql /tmp/db_setup.sql

COPY ./tools/script.sh /tmp/script.sh
# ---
RUN chmod 755 /tmp/script.sh

# Expose the port for other containers in the network
EXPOSE 3306

# everything after this line will be executed by this distingueshed individual
USER mysql

# les go!!!!!!!!!!!!!!!
CMD [ "bash", "/tmp/script.sh" ]
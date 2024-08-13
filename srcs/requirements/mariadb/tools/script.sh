#!/bin/bash

service mariadb start

sleep 1

if [ -d "/var/lib/mysql/$DB_NAME" ]
then 

	echo "Database already exists"
else
	mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
        mariadb  -e "CREATE USER IF NOT EXISTS ${DB_USER}@'localhost' IDENTIFIED BY '${DB_PASS}';"
        mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"
        # mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';"
        mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

mysqld_safe
#!/bin/bash

# #DEBUG
# echo "db name: ${DB_NAME}"
# echo "root: ${DB_ROOT}"
# echo "db pass: ${DB_PASS}"

# # Start MariaDB in safe mode
mysqld_safe --datadir='/var/lib/mysql' &
# Check if the database exists
# DB_EXISTS=$(mysql -u root -p ${DB_ROOT} -e "SHOW DATABASES LIKE '${DB_NAME}';" | grep ${DB_NAME} > /dev/null; echo "$?")
# if [ $DB_EXISTS -eq 0 ]; then
#     echo "The database ${DB_NAME} already exists."
# else
#     # Create the database if it doesn't already exist
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
#     # Create a user and assign a password
#     mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
#     # Grant all privileges on the database to the user
#     mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
#     # Change the root user's password
#     mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';"
#     # Refresh privileges to apply the changes
#     mysql -u root -p"${DB_ROOT}" -e "FLUSH PRIVILEGES;"
#     mysqladmin -u root -p$DB_ROOT shutdown
#     echo "Configuration completed."
# # fi
# Restart MariaDB
exec mysqld_safe --datadir='/var/lib/mysql'
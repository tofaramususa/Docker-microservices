#!/bin/bash

# Start the MariaDB service and wait for it to be ready
service mariadb start
until mysqladmin ping -h localhost --silent; do
    echo "Waiting for MariaDB to be available..."
    sleep 1
done
echo "MariaDB is now available."

# Create the database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';"
mysql -u root -p"${DB_ROOT}" -e "FLUSH PRIVILEGES;"

# Gracefully shut down the MariaDB service
mysqladmin -u root -p"${DB_ROOT}" shutdown
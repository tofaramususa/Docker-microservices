#!/bin/bash
# Start MariaDB in safe mode
mysqld_safe --datadir='/var/lib/mysql' &
# Check if the database exists
DB_EXISTS=$(mysql -u root -p${SQL_ROOT_PASSWORD} -e "SHOW DATABASES LIKE '${SQL_DATABASE}';" | grep ${SQL_DATABASE} > /dev/null; echo "$?")
if [ $DB_EXISTS -eq 0 ]; then
    echo "The database ${SQL_DATABASE} already exists."
else
    # Create the database if it doesn't already exist
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    # Create a user and assign a password
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    # Grant all privileges on the database to the user
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;"
    # Change the root user's password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    # Refresh privileges to apply the changes
    mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
    echo "Configuration completed."
fi
# Restart MariaDB
exec mysqld_safe --datadir='/var/lib/mysql'
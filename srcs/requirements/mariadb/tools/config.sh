#!/usr/bin/env bash

# Append configuration to MySQL configuration file to allow remote connections
{
    echo
    echo "[mysqld]"
    echo "bind-address=0.0.0.0"
} >> /etc/mysql/my.cnf

# Initialize the MySQL data directory
mysql_install_db --datadir=/var/lib/mysql

# Start MySQL server in the background
mysqld_safe &
mysql_pid=$!

# Wait until MySQL server is ready to accept connections
until mysqladmin ping &>/dev/null; do
    echo "Waiting for mysqld to be ready..."
    sleep 0.2
done

# Execute MySQL commands to set up database and user
mysql -u root -e "
    CREATE DATABASE $DB_DATABASE;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
    FLUSH PRIVILEGES;
"

# Wait for the MySQL server process to finish
# This ensures that the script does not exit before the server has fully initialized
wait $mysql_pid

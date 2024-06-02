#!/bin/sh

DB_DIRECTORY=/var/lib/mysql
RUNNING_DIRECTORY=/run/mysqld
INIT_SH=tmp.sql
OPTIONS="--user=mysql --skip-name-resolve --skip-networking=0 --bind-address=0.0.0.0"

# Ensure the data directory and run directory exist
mkdir -p $DB_DIRECTORY $RUNNING_DIRECTORY
chown -R mysql:mysql $DB_DIRECTORY $RUNNING_DIRECTORY

# Initialize the MariaDB data directory
if ! mysql_install_db --user=mysql --datadir=$DB_DIRECTORY > /dev/null ; then
    echo "Failed to create database"
    exit 1
fi
echo "Database directory created"

# Create a temporary SQL script with environment variables resolved
if [ -f init_db.sql ]; then
    envsubst < init_db.sql > $INIT_SH
else
    echo "init_db.sql not found"
    exit 1
fi

# Execute the initialization script in bootstrap mode
mysqld $OPTIONS --bootstrap < $INIT_SH

# Remove the temporary script
rm -f $INIT_SH

# Run the SQL server in the foreground
exec mysqld $OPTIONS --console

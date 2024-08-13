#!/bin/sh

#for simplicity
DATA_DIR=/var/lib/mysql
RUN_DIR=/run/mysqld
INIT_DB_SCRIPT=tmp_script.sql
MYSQL_OPTIONS="--user=mysql --skip-name-resolve --skip-networking=0 --bind-address=0.0.0.0"

# initializing our data directory to store dbs!
if ! mysql_install_db --user=mysql --datadir=$DATA_DIR > /dev/null ; then
    echo "{Data directory instialization --- FAILURE!}"
    return 1
fi
echo "{Data directory instialization --- SUCCESSSS!}"

# creating a tmp sql script with env variables resolved (gonna delete it after execution)
envsubst < db_setup.sql > $INIT_DB_SCRIPT

# feeding mysql deamon our init script, (bootstrap mode just means start from a clean slate)
mysqld $MYSQL_OPTIONS --bootstrap < $INIT_DB_SCRIPT

# gotta delete it coz our passwords are exposed in this file
rm $INIT_DB_SCRIPT

# Run the SQL server in the foreground (serer output to the STDOUT for debugging)
mysqld $MYSQL_OPTIONS --console
#!/bin/sh

MYSQL_OPTIONS="--user=mysql --skip-name-resolve --skip-networking=0 --bind-address=0.0.0.0"

if ! mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null ; then
    echo "Initializing MySQL Data Directory FAILED"
    return 1
fi
echo "Initializing MySQL Data Directory COMPLETED"

envsubst < /tmp/init_db.sql > /tmp/tmp_script.sql

mysqld $MYSQL_OPTIONS --bootstrap < /tmp/tmp_script.sql

rm /tmp/tmp_script.sql

mysqld $MYSQL_OPTIONS --console

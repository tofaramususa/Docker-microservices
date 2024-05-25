#!/usr/bin/env bash

echo >> /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

mysql_install_db --datadir=/var/lib/mysql

mysqld_safe &
mysql_pid=$!

until mysqladmin ping &>/dev/null; do
	echo "Waiting for mysqld to be ready..."
	sleep 0.2
done

mysql -u root -e "CREATE DATABASE $DB_DATABASE;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
    FLUSH PRIVILEGES;"



wait $mysql_pid # waits for the MDB server process to finish. this insures that the script does not exit before the server has fully initialized

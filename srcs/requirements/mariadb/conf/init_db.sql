FLUSH PRIVILEGES;  -- this is used to reset the priviledges

CREATE DATABASE IF NOT EXISTS `$WORDPRESS_DB_DATABASE`;  -- create database with this name
ALTER USER 'root'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_ROOT_PASSWORD'; -- replace the root@localhost password 
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_PASSWORD'; -- new user and password
GRANT ALL PRIVILEGES ON `$WORDPRESS_DB_DATABASE`.* TO '$WORDPRESS_DB_USER'@'%'; -- give all priviledges to the new user over the database

FLUSH PRIVILEGES; -- this makes show it takes effect in terms of priviledges

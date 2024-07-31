FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS `$WORDPRESS_DB_DATABASE`;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_ROOT_PASSWORD';
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON `$WORDPRESS_DB_DATABASE`.* TO '$WORDPRESS_DB_USER'@'%';

FLUSH PRIVILEGES;

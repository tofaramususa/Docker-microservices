FLUSH PRIVILEGES;
-- database sertup best practices
-- clean everything that comes as a default
DELETE FROM mysql.user WHERE user='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE db='test';

-- Security best practices
-- remove root remote access.
-- change the root password for the localhost
DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT');

-- creating new Database, new user (with its password), grating this user full privilege eate new database, 
CREATE DATABASE IF NOT EXISTS `$DB_NAME`;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';
GRANT ALL PRIVILEGES ON `$DB_NAME`.* TO '$DB_USER'@'%';

-- and reloading the privilege table so the change can be reflected imidiately
FLUSH PRIVILEGES;

-- SQL commands
/* 
    1. SHOW DATABASES;
    2. SELECT user FROM mysql.user;
 */
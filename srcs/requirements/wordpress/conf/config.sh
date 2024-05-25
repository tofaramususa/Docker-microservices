#!/usr/bin/env bash
cd /var/www/html/wordpress
wp core download --force --allow-root
wp config create --path=$WP_ROUTE --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOSTNAME --dbprefix=wp_

if ! wp core is-installed --allow-root --path=$WP_ROUTE; then
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root
fi

mkdir -p /run/php/
php-fpm7.4 -F
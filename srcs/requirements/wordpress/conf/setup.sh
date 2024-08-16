#!/bin/sh

wp core download --allow-root --locale=en_US

if [ ! -f "/var/www/wp-config.php" ]; then

	wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --dbcharset="utf8" 
fi

wp core install  --allow-root \
    --url="$DOMAIN_NAME" \
    --title="Tofara's WordPress" \
    --admin_user="$WPADUSER" \
    --admin_password="$WPADPASS" \
    --admin_email="$WPADEMAIL"

wp user create   --allow-root "$WPUSER1" "user1@student.42abudhabi.ae" \
  --role=author \
  --user_pass="$WPUSER1PASS" \
 

wp option update blogname "Tofara's Word-Press" --allow-root
wp option update blogdescription "The Inception" --allow-root
wp option update blog_public 0 --allow-root

wp theme install twentytwentyone --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm82 -F
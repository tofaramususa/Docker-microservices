#!/bin/sh

wp --allow-root --path=/var/www core install \
  --url="$DOMAIN_NAME" \
  --title="Tofara's Word-Press" \
  --admin_user="$WPADUSER" \
  --admin_password="$WPADPASS" \
  --admin_email="tmususa@student.42abudhabi.ae"

wp user create "$WPUSER1" "user1@student.42abudhabi.ae" \
  --role=author \
  --user_pass="$WPUSER1PASS" \
  --allow-root

wp --allow-root --path=/var/www option update blogname "Tofara's Word-Press"
wp --allow-root --path=/var/www option update blogdescription "The Inception"
wp --allow-root --path=/var/www option update blog_public 0

wp theme install twentytwentyone --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm82 -F
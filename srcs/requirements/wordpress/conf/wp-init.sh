#!/bin/sh

# Use wp-cli.phar directly as 'wp' might not be in PATH
if ! php /usr/local/bin/wp-cli.phar core is-installed --allow-root --path=/var/www/html/wordpress; then
    php /usr/local/bin/wp-cli.phar core install --path=/var/www/html/wordpress --url="$DOMAIN_NAME" --title=Inception --admin_user="$WPADUSER" --admin_password="$WPADPASS" --admin_email="$WPADUSER@$DOMAIN_NAME" --allow-root
    php /usr/local/bin/wp-cli.phar user create "$WPUSER1" "$WPUSER1@$DOMAIN_NAME" --role=subscriber --user_pass="$WPUSER1PASS" --allow-root --path=/var/www/html/wordpress
fi

# Update all plugins
php /usr/local/bin/wp-cli.phar plugin update --all --allow-root --path=/var/www/html/wordpress

# Start PHP-FPM (for PHP 8.1)
exec /usr/sbin/php-fpm81 -F
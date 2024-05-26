#!/usr/bin/env bash

# Navigate to the WordPress directory
cd /var/www/html/wordpress

# Download WordPress core files with force option and root privileges
wp core download --force --allow-root

# Create the WordPress configuration file with provided environment variables
wp config create --path="$WP_ROUTE" \
                 --allow-root \
                 --dbname="$DB_DATABASE" \
                 --dbuser="$DB_USER" \
                 --dbpass="$DB_PASSWORD" \
                 --dbhost="$DB_HOSTNAME" \
                 --dbprefix=wp_

# Check if WordPress is installed, if not, install it
if ! wp core is-installed --allow-root --path="$WP_ROUTE"; then
    wp core install --url="$WP_URL" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASS" \
                    --admin_email="$WP_ADMIN_EMAIL" \
                    --allow-root
    
    # Create a new WordPress user with the role of author
    wp user create "$WP_USER" "$WP_EMAIL" \
                   --role=author \
                   --user_pass="$WP_PASS" \
                   --allow-root
fi

# Create the PHP runtime directory if it doesn't exist
mkdir -p /run/php/

# Start PHP FastCGI Process Manager
php-fpm7.4 -F

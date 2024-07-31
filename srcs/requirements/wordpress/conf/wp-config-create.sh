#!bin/sh
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
cat << EOF > /var/www/html/wordpress/wp-config.php
<?php
define( 'DB_NAME', '${WORDPRESS_DB_DATABASE}' );
define( 'DB_USER', '${WORDPRESS_DB_USER}' );
define( 'DB_PASSWORD', '${WORDPRESS_DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
EOF
fi
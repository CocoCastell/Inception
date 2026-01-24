#!/bin/sh

set -e

if [ ! -e /etc/.firstrun ]; then
	wget https://wordpress.org/wordpress-6.8.3.tar.gz
	tar -xzf wordpress-6.8.3.tar.gz
	rm wordpress-6.8.3.tar.gz
	chown -R nobody:nobody /var/www/wordpress
	sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php84/php-fpm.d/www.conf 
	touch /etc/.firstrun
fi

if [ ! -e .firstmount ]; then
	echo "Configuring Wordpress..."
	{
		echo "<?php"
		echo "define( 'DB_NAME', '$WP_DB' );"
		echo "define( 'DB_USER', '$WP_ADMIN' );"
		echo "define( 'DB_PASSWORD', '$WP_ADMIN_PW' );"
		echo "define( 'DB_HOST', 'mariadb' );"
		echo "define( 'DB_CHARSET', 'utf8' );"
		echo "define( 'DB_COLLATE', '' );"
	
		echo "define( 'AUTH_KEY',         'put your unique phrase here' );"
		echo "define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );"
		echo "define( 'LOGGED_IN_KEY',    'put your unique phrase here' );"
		echo "define( 'NONCE_KEY',        'put your unique phrase here' );"
		echo "define( 'AUTH_SALT',        'put your unique phrase here' );"
		echo "define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );"
		echo "define( 'LOGGED_IN_SALT',   'put your unique phrase here' );"
		echo "define( 'NONCE_SALT',       'put your unique phrase here' );"

		echo "\$table_prefix = 'wp_';"
		echo "define( 'WP_DEBUG', true);"
		echo "define('WP_DEBUG_LOG', true);"
		echo "define('WP_MEMORY_LIMIT', '1536M');"
		echo "if ( ! defined( 'ABSPATH' ) ) {"
		echo "	define( 'ABSPATH', __DIR__ . '/' );"
		echo "}"
		echo "require_once ABSPATH . 'wp-settings.php';"
	}	> wordpress/wp-config.php
	touch .firstmount
fi

exec /usr/sbin/php-fpm84 -F

#!/bin/sh

set -e

if [ ! -d /var/lib/mysql/mysql ]; then
	
	{
		echo "FLUSH PRIVILEGES;"
		echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"
		echo "CREATE DATABASE $WP_DB;"
		echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW';"
		echo "GRANT ALL PRIVILEGES ON $WP_DB.* TO '$MYSQL_USER'@'%';"
		echo "FLUSH PRIVILEGES;"
	}	> $DB_CONF_FILE

	mariadb-install-db --user=mysql
	mysqld --user=mysql --bootstrap < $DB_CONF_FILE
	rm $DB_CONF_FILE
fi

exec mysqld --user=mysql

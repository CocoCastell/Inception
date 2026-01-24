#!/bin/sh

set -e

if [ ! -d /var/lib/mysql/mysql ]; then
	
	{
		echo "FLUSH PRIVILEGES;"
		echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'impossiblepassword';"
		echo "CREATE DATABASE $WP_DB;"
		echo "CREATE USER '$WP_ADMIN'@'%' IDENTIFIED BY '$WP_ADMIN_PW';"
		echo "GRANT ALL PRIVILEGES ON $WP_DB.* TO $WP_ADMIN;"
       		echo "CREATE USER '$WP_USER1'@'%' IDENTIFIED BY '$WP_USER1_PW';"
		echo "GRANT SELECT, DELETE, INSERT, UPDATE ON $WP_DB.* TO $WP_USER1;"
	}	> $DB_CONF_FILE

	mariadb-install-db --user=mysql
	mysqld --user=mysql --bootstrap < $DB_CONF_FILE
	rm $DB_CONF_FILE
fi

exec mysqld --user=mysql

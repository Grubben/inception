#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then

	# mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	# mysql_install_db --user=mysql --datadir=/var/lib/mysql

	# mysqld -u root --bootstrap <<EOF
	mysqld -u mysql --bootstrap <<EOF
		flush privileges;
		create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
		delete from mysql.user where user='';
		flush privileges;
EOF
		# delete from mysql.user where user='root';

fi

mysqld -u mysql
# mysqld -u root
# tail -f /dev/null

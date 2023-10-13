#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/$MARIADB_NAME" ]; then

	mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

	mysqld -u mysql --bootstrap <<EOF
		flush privileges;
		create user '$MARIADB_USER'@'%' identified by '$MARIADB_PASSWORD';
		create database $MARIADB_NAME;
		grant all on $MARIADB_NAME.* to '$MARIADB_USER'@'%';
		delete from mysql.user where user='';
		delete from mysql.user where user='root';
		flush privileges;
EOF

fi

exec mysqld -u mysql
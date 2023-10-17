#!/bin/sh

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# # php wp-cli.phar --info
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# wait for mariadb to start
while ! mysql -h mariadb -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2> /dev/null; do
sleep 1
done

wp core is-installed 2> /dev/null
if [ $? -ne 0 ] ; then
	wp core download --allow-root
	# wp config create --dbname=${MYSQL_DATABASE} \
    wp core config --dbname=${MYSQL_DATABASE} \
				   --dbuser=${MYSQL_USER} \
				   --dbpass=${MYSQL_PASSWORD} \
				   --dbhost=${DB_HOSTNAME}

	wp core install --url=${URL} \
					--title=${TITLE} \
					--admin_user=${WP_ADMIN} \
					--admin_password=${WP_ADMIN_PASS} \
					--admin_email=${WP_ADMIN_EMAIL}

	wp user create ${WP_USER} \
					${WP_USER_EMAIL} \
					--user_pass=${WP_USER_PASS}
fi

php-fpm$PHP_V -FO
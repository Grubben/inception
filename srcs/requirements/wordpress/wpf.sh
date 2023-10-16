#!/bin/sh
# groupadd wordpress_user
# useradd -g wordpress_user wordpress_user

# cd /var/www/
# curl https://wordpress.org/latest.tar.gz | tar zx
# mv wordpress/* .
# rm -d /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

wp core download

cp /wp-config.php /var/www/wordpress

wp core install --allow-root --url=$URL --title=$TITLE --admin_user=root --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=root@42.fr
wp user create --allow-root user user@user.user --user_pass=user

chmod -R 0777 /var/www/wordpress/wp-content/

echo Running php-fpm
php-fpm81 -F -R

echo php Failed
# tail -f /dev/null
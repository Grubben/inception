#!/bin/sh
# groupadd wordpress_user
# useradd -g wordpress_user wordpress_user

cd /var/www/
curl https://wordpress.org/latest.tar.gz | tar zx
mv wordpress/* .
rm -d /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

tail -f /dev/null
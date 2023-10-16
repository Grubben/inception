FROM alpine:3.17

ARG PHP_V=

RUN apk update && apk upgrade && apk add --no-cache bash curl php php-fpm php-phar php-mysqli php-iconv
# RUN apkd add --no-cache ghostcr

#unnecessary but explicit
EXPOSE 9000

# COPY wp-config.php /var/www/
COPY wp-config.php /

COPY wordpress_pool.conf 

COPY wpf.sh /wpf.sh

ENTRYPOINT [ "sh", "wpf.sh" ]
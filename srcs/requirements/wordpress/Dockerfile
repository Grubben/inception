FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache bash curl php php-fpm php-phar
# RUN apkd add --no-cache ghostcr

#unnecessary but explicit
EXPOSE 9000

COPY wp-config.php /var/www/wordpress/

COPY wpf.sh /wpf.sh

ENTRYPOINT [ "sh", "wpf.sh" ]
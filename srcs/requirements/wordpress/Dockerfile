FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache curl php php-fpm php-phar
# RUN apkd add --no-cache ghostcr
# wp-cli

#unnecessary but explicit
EXPOSE 9000

COPY wpf.sh /wpf.sh

ENTRYPOINT [ "sh", "wpf.sh" ]
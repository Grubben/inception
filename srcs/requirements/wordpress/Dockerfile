FROM alpine:3.17

ARG PHP_V=81

RUN apk -U upgrade && apk add --no-cache vim bash curl php${PHP_V} \
    php${PHP_V}-fpm \
    php${PHP_V}-phar \
    php${PHP_V}-json \
    php${PHP_V}-mysqli \
    php${PHP_V}-iconv \
    # Highly recommended
    php${PHP_V}-curl \
    php${PHP_V}-dom \
    php${PHP_V}-exif \
    php${PHP_V}-fileinfo \
    # php${PHP_V}-hash \
    # php${PHP_V}-igbinary \
    # php${PHP_V}-imagick \
    php${PHP_V}-intl \
    php${PHP_V}-mbstring \
    php${PHP_V}-openssl \
    # php${PHP_V}-pcre \
    php${PHP_V}-xml \
    php${PHP_V}-zip \
    php${PHP_V}-apcu \
    # php${PHP_V}-memcached \
    php${PHP_V}-opcache \
    php${PHP_V}-redis \
    php${PHP_V}-tokenizer \
    mariadb-client
# RUN apk add php php-fpm


COPY wordpress_pool.conf /etc/php${PHP_V}/php-fpm.d/www.conf
# tell php-fpm not to daemonize
# RUN sed -ie 's/;daemonize = yes/daemonize = no/g' /etc/php${PHP_V}/php-fpm.conf

# setup user www-data
RUN adduser -S www-data


#   SETUP WORDPRESS #
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

COPY wpf.sh /

#unnecessary but explicit
EXPOSE 9000

ENTRYPOINT [ "sh", "/wpf.sh" ]
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
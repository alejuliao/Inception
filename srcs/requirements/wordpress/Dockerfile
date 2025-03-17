FROM alpine:3.20.6

ARG WP_TITLE
ARG WP_DOMAIN
ARG WP_EMAIL
ARG WP_USER
ARG WP_PASSWORD
ARG SQL_USER
ARG SQL_ROOT_PASSWORD

RUN apk update && apk upgrade && \
    apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-mbstring \
    php-cli \
    php-phar \
    mariadb-client \
     php-tokenizer \
    curl vim bash

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

RUN chown -R nobody:nobody /var/www/html/

COPY /conf/www.conf /etc/php83/php-fpm.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/init.sh /var/www/html/

RUN sed -i \
    -e "s|\${WP_TITLE}|${WP_TITLE}|g" \
    -e "s|\${WP_DOMAIN}|${WP_DOMAIN}|g" \
    -e "s|\${WP_EMAIL}|${WP_EMAIL}|g" \
    -e "s|\${WP_USER}|${WP_USER}|g" \
    -e "s|\${WP_PASSWORD}|${WP_PASSWORD}|g" \
    -e "s|\${SQL_USER}|${SQL_USER}|g" \
    -e "s|\${SQL_ROOT_PASSWORD}|${SQL_ROOT_PASSWORD}|g" \
    /var/www/html/init.sh

#clean apk useless

RUN chmod +x /var/www/html/init.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/var/www/html/init.sh"]
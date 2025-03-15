FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-mbstring \
    php-cli \
    php-phar \
    mariadb-client\
    curl vim bash

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

RUN chown -R nobody:nobody /var/www/html/

COPY /srcs/www.conf /etc/php83/php-fpm.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

# RUN wp config create --dbname=wpdb --dbuser=ajuliao --dbpass='123@Password321' --dbhost=mariadb --dbprefix=wp_

#clean apk useless

EXPOSE 9000

CMD ["php-fpm83", "-F"]
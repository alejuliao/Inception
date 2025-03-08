FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-mbstring \
    curl vim bash

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz && apk del curl

RUN chown -R nobody:nobody /var/www/html/

COPY /srcs/www.conf /etc/php83/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm83", "-F"]
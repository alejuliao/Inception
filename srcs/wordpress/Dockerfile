FROM alpine:3.19

RUN apk update && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-gd \
    php81-xml \
    php81-curl \
    php81-mbstring \
    php81-zip \
    curl

WORKDIR /var/www/html 

RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

RUN chown -R nobody:nobody /var/www/html

COPY /srcs/www.conf /etc/php81/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm81", "-F"]
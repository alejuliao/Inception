FROM alpine:3.20.6

RUN apk update && apk upgrade && \
    apk add --no-cache \
    curl \
    php83 \
    php83-mysqli \
    php83-session

RUN mkdir -p /var/www/htdocs

RUN curl -L -o /var/www/htdocs/adminer.php https://github.com/vrana/adminer/releases/download/v5.0.6/adminer-5.0.6-mysql.php

RUN echo "extension=session.so" >> /etc/php83/php.ini

EXPOSE 8000

CMD ["php83", "-S", "0.0.0.0:8000", "/var/www/htdocs/adminer.php"]

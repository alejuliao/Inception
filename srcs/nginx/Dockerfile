FROM alpine:latest

RUN apk update && apk upgrade && \
    apk --update add --no-cache nginx openssl bash

RUN mkdir -p /etc/ssl/private /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/ajuliao.key \
    -out /etc/nginx/ssl/ajuliao.crt -days 365 -nodes \
    -subj "/C=BR/ST=SP/L=SP/O=42sp/OU=IT/CN=ajuliao.42.fr"

RUN mkdir -p /usr/share/nginx/html/
COPY ./srcs/html/index.html /usr/share/nginx/html/

RUN mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/00-default.conf
COPY ./srcs/01-ajuliao.conf /etc/nginx/http.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

FROM alpine:3.20.6

ARG WP_DOMAIN

RUN echo ${WP_DOMAIN}

RUN apk update && apk upgrade && \
    apk --update add --no-cache nginx openssl bash

RUN mkdir -p /etc/ssl/private /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/${WP_DOMAIN}.key \
    -out /etc/nginx/ssl/${WP_DOMAIN}.crt -days 365 -nodes \
    -subj "/C=BR/ST=SP/L=SP/O=42sp/OU=IT/CN=${WP_DOMAIN}"

RUN mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/00-default.conf

COPY ./srcs/01-ajuliao.conf /etc/nginx/http.d/

RUN sed -i "s|\${WP_DOMAIN}|${WP_DOMAIN}|g" /etc/nginx/http.d/01-ajuliao.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

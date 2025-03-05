FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb \
    mariadb-client \
    mariadb-server-utils gettext

RUN mkdir -p /run/mysqld /docker-entrypoint-initdb.d && chown -R mysql:mysql /var/lib/mysql /run/mysqld /docker-entrypoint-initdb.d

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./srcs/init-db.sh ./init-db.sh

COPY ./srcs/50-server.cnf /etc/my.cnf.d/50-server.cnf

RUN chmod +x ./init-db.sh

EXPOSE 3306

CMD ["./init-db.sh"]
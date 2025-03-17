FROM alpine:3.20.6

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_ROOT_PASSWORD

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils gettext bash

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /var/lib/mysql /run/mysqld

RUN mkdir -p /var/log/mysql && chown -R mysql:mysql /var/log/mysql

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN if [ ! -d "/var/lib/mysql/mysql" ]; then \
        mariadb-install-db --user=mysql --datadir=/var/lib/mysql;\
    fi && \
    mariadbd --datadir=/var/lib/mysql --user=mysql & \
    until mariadb-admin ping --silent; do sleep 1; done && \
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}; \
                       CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'; \
                       GRANT ALL PRIVILEGES ON wpdb.* TO '${SQL_USER}'@'%' WITH GRANT OPTION; \
                       FLUSH PRIVILEGES;" && \
    mariadb-admin -u root password "${SQL_ROOT_PASSWORD}" && \
    mariadb -u root --password="${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mariadbd", "--datadir=/var/lib/mysql", "--user=mysql"]
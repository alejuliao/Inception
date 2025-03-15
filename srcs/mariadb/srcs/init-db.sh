#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Inicializando o banco de dados MariaDB..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd --datadir=/var/lib/mysql --user=mysql &

until mariadb-admin ping --silent; do
    sleep 1
done

mariadb -u root -e "
    CREATE DATABASE IF NOT EXISTS wpdb;

    CREATE USER IF NOT EXISTS 'ajuliao'@'%' IDENTIFIED BY ${SQL_ROOT_PASSWORD};

    GRANT ALL PRIVILEGES ON wpdb.* TO 'ajuliao'@'%' WITH GRANT OPTION;

    FLUSH PRIVILEGES;" 

mariadb-admin -u root password "${SQL_ROOT_PASSWORD}"

mariadb -u root --password="${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

wait

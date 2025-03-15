#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Inicializando o banco de dados MariaDB..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd --datadir=/var/lib/mysql --user=mysql &

until mariadb-admin ping --silent; do
    sleep 1
done

mariadb -u root "
    CREATE DATABASE IF NOT EXISTS wpdb;

    CREATE USER IF NOT EXISTS 'ajuliao'@'%' IDENTIFIED BY '123@Password321';

    GRANT ALL PRIVILEGES ON wpdb.* TO 'ajuliao'@'%' WITH GRANT OPTION;

    FLUSH PRIVILEGES;" 

    # CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
    # CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    # GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
    # FLUSH PRIVILEGES;"
    
    # CREATE USER IF NOT EXISTS 'ajuliao'@'%' IDENTIFIED BY '123@Password321';
    # GRANT ALL PRIVILEGES ON *.* TO 'ajuliao'@'%' WITH GRANT OPTION;
    # FLUSH PRIVILEGES;


mariadb-admin -u root password "${SQL_ROOT_PASSWORD}"

mariadb -u root --password="${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

wait

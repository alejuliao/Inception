#!/bin/sh

if [ ! -f wp-config.php ]; then
    wp config create --dbname=wpdb --dbuser=${WP_USER} --dbpass=${WP_PASSWORD} --dbhost=mariadb --dbprefix=wp_ --allow-root
    # echo "\$_SERVER['HTTP_HOST'] = '${WP_DOMAIN}';" >> wp-config.php
fi

if ! wp core is-installed --allow-root; then
    wp core install --url=${WP_DOMAIN} --title="${WP_TITLE}" --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL} --skip-email --allow-root;
fi

exec php-fpm83 -F
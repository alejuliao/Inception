#!/bin/sh

if [ ! -f wp-config.php ]; then
    wp config create --dbname=wpdb --dbuser="${WP_USER}" --dbpass="${WP_PASSWORD}" --dbhost=mariadb --dbprefix=wp_ --allow-root
    echo "\$_SERVER['HTTP_HOST'] = '${WP_DOMAIN}';" >> wp-config.php
fi

wp config set WP_REDIS_HOST "redis" --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE true --raw --allow-root

if ! wp core is-installed --allow-root; then
    wp core install --url=${WP_DOMAIN} --title="${WP_TITLE}" --admin_user="${WP_USER}" --admin_password="${WP_PASSWORD}" --admin_email="${WP_EMAIL}" --skip-email --allow-root;
fi

if ! wp user get ${WP_SECOND_USER} --allow-root >/dev/null 2>&1; then
    wp user create --allow-root \
        --path=/var/www/html \
        ${WP_SECOND_USER} \
        ${WP_SECOND_USER_MAIL} \
        --user_pass=${WP_SECOND_PASSWORD} \
        --role='author'
fi


wp plugin install redis-cache --activate --allow-root

wp option set redis_cache_expiration 300 --allow-root

wp redis enable --allow-root

exec php-fpm83 -F

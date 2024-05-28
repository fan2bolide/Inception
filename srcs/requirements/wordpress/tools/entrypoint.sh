#!/bin/bash
echo -1 >& 2

echo 0 >& 2

export MYSQL_PWD=`$MYSQL_PASSWORD`

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    echo 1 >& 2
    wp core download --allow-root \
                     --path=/var/www/wordpress || exit 1

    echo 2 >& 2
    sleep 10

    wp config create --allow-root \
                     --dbhost=$MYSQL_HOST:$MYSQL_PORT \
                     --dbuser=$MYSQL_USER \
                     --dbpass=$MYSQL_PWD \
                     --dbname=$MYSQL_DATABASE \
                     --path=/var/www/wordpress || exit 2

    echo 3 >& 2

    wp core install --allow-root \
                    --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_user="$WP_ADMIN_NAME" \
                    --admin_email="$WP_ADMIN_MAIL" \
                    --title="Inception" \
                    --url="bajeanno.42.fr" \
                    --path=/var/www/wordpress || exit 3

    echo 4 >& 2

    wp user create $WP_USER_NAME $WP_USER_MAIL --allow-root \
                                               --user_pass="$WP_USER_PASSWORD" \
                                               --path=/var/www/wordpress || exit 4
fi
echo 5 >& 2
chown -R www-data:www-data /var/www/wordpress
chown -R www-data:www-data /run/php
chown -R www-data:www-data /var/www/html/wp-content

exec "$@"

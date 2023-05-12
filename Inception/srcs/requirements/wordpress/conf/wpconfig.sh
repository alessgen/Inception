#!/bin/sh

rm -rf /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check

if ! wp core is-installed --allow-root; then
    wp core install --url="alemafe.42.fr" --title="alemafe's wordpress site" --admin_user="female" --admin_password="gucci" --admin_email="deasy3067@gmail.com" --path="/var/www/html/wordpress/" --allow-root
fi

if ! wp user get lorem --allow-root; then
	wp user create lorem lorem@ipsum.fr --role=author --user_pass="123" --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

exec php-fpm7.3 --nodaemonize
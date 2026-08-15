#!/bin/sh
set -eu 
mkdir -p "/var/www/html"
cd /var/www/html

if [ ! -f "wp-config.php" ]; then

wp core download --allow-root
wp config create --dbname="$DB_NAME" --dbuser="$DB_USERNAME" --dbpass="$DB_PASSWORD" --allow-root --dbhost="$DB_HOST" --dbprefix="$DB_PREFIX"
wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root
wp user create "$USER1" "$USER1_EMAIL" --user_pass="$USER_PASSWORD" --role=subscriber --allow-root

fi

exec php-fpm -F
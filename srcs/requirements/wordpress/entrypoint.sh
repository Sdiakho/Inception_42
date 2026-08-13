#! bin/sh

mkdir -p "/var/www/html"
cd var/www/html

if [ ! -f "wp-config.php" ]; then

wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USERNAME --dbpass=$DB_PASSWORD --allow-root
wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --allow-root
wp user create user1 user1@exemple.com --allow-root

fi

exec php-fpm85 -F
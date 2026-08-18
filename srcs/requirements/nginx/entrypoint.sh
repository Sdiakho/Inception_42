#!/bin/sh

set -eu
mkdir -p /var/www/html
chown -R nginx:nginx /var/www/html
if [  ! -f /etc/ssl/certs/nginx-selfsigned.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=$DOMAIN_NAME"
fi

exec nginx -g "daemon off;"
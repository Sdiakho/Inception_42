FROM alpine:3.24.1

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN apk --no-cache add php php-fpm php-mysqli php-phar php-mbstring curl mariadb-client
RUN curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp
RUN sed -i 's|listen = 127.0.0.1:9000|listen = 9000|g' /etc/php*/php-fpm.d/www.conf
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]


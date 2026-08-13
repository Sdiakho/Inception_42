FROM alpine:3.24.1

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

RUN apk add --no-cache mariadb mariadb-client
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql
RUN mkdir -p /run/mysqld && chown mysql /run/mysqld

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

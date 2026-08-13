 #!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then

mysqld --bootstrap << EOF

CREATE DATABASE $DB_NAME;

CREATE USER '$DB_USERNAME'@'%' IDENTIFIED BY '$USER_PASSWORD';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USERNAME'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '$R_PASSWORD';

FLUSH PRIVILEGES;

EOF

fi

exec mysqld --user=mysql 
#!/bin/bash

export MYSQL_PWD=`$MYSQL_PASSWORD`
#$MYSQL_ROOT_PASSWORD
#$MYSQL_PASSWORD
service mariadb start
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('`$MYSQL_ROOT_PASSWORD`'); \
                 DROP USER IF EXISTS ''@'$hostname'; \
                 DROP DATABASE IF EXISTS test; \
                 CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
                 GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '`$MYSQL_PASSWORD`'; \
                 FLUSH PRIVILEGES;"
mysqladmin -u root -p`$MYSQL_ROOT_PASSWORD` shutdown

exec "$@"
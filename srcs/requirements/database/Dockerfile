FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

WORKDIR /var/lib/mysql

RUN apt-get update && apt-get install mariadb-server -y
RUN apt-get install curl -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start \
    && mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD'); \
                 DROP USER IF EXISTS ''@'$hostname'; \
                 DROP DATABASE IF EXISTS test; \
                 CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
                 GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
                 FLUSH PRIVILEGES;" \
    && mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

EXPOSE 3306

ENTRYPOINT [ "mysqld_safe" ]

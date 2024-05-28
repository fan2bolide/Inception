FROM debian:bullseye

WORKDIR /var/lib/mysql

RUN apt-get update && apt-get install mariadb-server -y
RUN apt-get install curl -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf



EXPOSE 3306
COPY ./tools/entrypoint.sh /tools/entrypoint.sh
RUN chmod +x /tools/entrypoint.sh

ENTRYPOINT ["/tools/entrypoint.sh"]
CMD [ "mariadbd" ]

FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install --no-install-recommends -y mariadb-server
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
# 
# COPY tools/entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh
#
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd", "--bind-address=0.0.0.0"]


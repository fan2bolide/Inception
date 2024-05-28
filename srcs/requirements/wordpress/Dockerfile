FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install -y wget \
                   php7.4 \
                   php-fpm \
                   php-mysql \
                   mariadb-client

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.1/wp-cli-2.7.1.phar
RUN mv wp-cli-2.7.1.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

COPY ./tools/entrypoint.sh /tools/entrypoint.sh
RUN chmod +x /tools/entrypoint.sh

ENTRYPOINT ["/tools/entrypoint.sh"]
CMD [ "php-fpm7.4" ,  "-F" ]
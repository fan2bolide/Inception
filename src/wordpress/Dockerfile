FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install curl -y
RUN apt install wordpress -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

CMD ["wp", "--allow-root"]

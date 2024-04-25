FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install nginx -y

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 443
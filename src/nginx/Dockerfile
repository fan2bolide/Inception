FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install nginx -y

CMD ["nginx", "-g daemon off;"]

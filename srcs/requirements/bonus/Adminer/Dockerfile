FROM debian:buster


RUN apt update -y && apt upgrade -y && apt install -y \
	adminer \
	wget \
	php-mysqli

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/index.php


ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]

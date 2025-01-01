FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y \
			vim \
			sudo \
			wget \
			php7.3 \
			php7.3-mysql \
			php-fpm \
			mariadb-client \
			unzip

RUN wget https://wordpress.org/latest.zip -P /var/www/

RUN unzip /var/www/latest.zip -d /var/www/ && rm -rf /var/www/latest.zip


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


RUN chmod +x wp-cli.phar

# we should move command line interface to this path
RUN mv wp-cli.phar /usr/local/bin/wp


COPY conf/config.sh .

# RUN chmod +x  config.sh

EXPOSE  9000

CMD ["bash", "config.sh"]


FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt-get install mariadb-server -y \
	vim \
	sudo

COPY conf/50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/DBSetUp.sh .

RUN chmod +x DBSetUp.sh

EXPOSE 3306


CMD ["./DBSetUp.sh"]

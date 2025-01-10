FROM debian:buster

RUN apt update -y && apt upgrade -y \
	vim \
	vsftpd \
	ftp \
	curl \
	sudo

COPY tools/* .

CMD ["bash", "setUpFtp.sh"]

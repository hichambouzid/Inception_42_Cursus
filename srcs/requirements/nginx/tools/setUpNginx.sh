#!/bin/bash

apt update && apt upgrade -y && apt install -y \
					vim			\
					curl		\
					sudo 		\
					nginx openssl
mkdir -p /etc/nginx/ssl
openssl  req -x509 -nodes -out /etc/nginx/ssl/certif.crt \
-keyout /etc/nginx/ssl/private.key \
-subj /C=MA/ST=STUDENT/L=BENGRUIR/O=1337/CN=hibouzid.42.fr/UID=hibouzid



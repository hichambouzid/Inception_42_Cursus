#!/bin/bash

apt update && apt upgrade -y && apt install -y \
					vim			\
					curl		\
					sudo 		\
					nginx openssl
mkdir -p /etc/nginx/ssl
openssl  req -x509 -nodes -out /etc/nginx/ssl/certif.crt \
-keyout /etc/nginx/ssl/private.key \
-subj /



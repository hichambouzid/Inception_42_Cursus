FROM	debian:buster

RUN		mkdir -p /var/run/nginx

COPY	tools/setUpNginx.sh .

RUN		chmod +x setUpNginx.sh

RUN		bash setUpNginx.sh

COPY	conf/nginx.conf /etc/nginx/nginx.conf
RUN		mkdir -p /var/run/nginx
RUN		chown -R www-data:www-data /var/www/html
RUN		chmod -R 775 /var/www/html

CMD		["nginx" , "-g" ,"daemon off;"]

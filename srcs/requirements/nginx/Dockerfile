FROM	debian:buster

RUN		mkdir -p /var/run/nginx

COPY	tools/setUpNginx.sh .

RUN		chmod +x setUpNginx.sh

RUN		bash setUpNginx.sh

COPY	conf/nginx.conf /etc/nginx/conf.d
RUN		mkdir -p /var/run/nginx
RUN		chmod -R 775 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD		["nginx" , "-g" ,"daemon off;"]

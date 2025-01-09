#!/bin/bash

# Wait for MariaDB to be ready
sleep 10

# Download WordPress core files
wp core download --path=/var/www/html --allow-root

# Move and configure wp-config.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASS/" /var/www/html/wp-config.php
sed -i "s/localhost/$DB_HOST/" /var/www/html/wp-config.php

# Install WordPress
wp core install \
    --url=$URL_USER \
    --title="$TT_WP" \
    --admin_user=$AD_USER \
    --admin_password=$AD_PASSWORD \
    --admin_email=$AD_EMAIL \
    --path=/var/www/html \
    --allow-root

# Create an additional WordPress user
wp user create \
    $WP_USER \
    $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PASSWORD \
    --path=/var/www/html \
    --allow-root

#install redis object cache
wp plugin install redis-cache --activate --path=/var/www/html --allow-root
wp config set WP_REDIS_HOST "127.0.0.1" --type=constant --path=/var/www/html --allow-root
wp config set WP_REDIS_PORT 6379 --type=constant --path=/var/www/html --allow-root
service redis-cli restart
# checking if redis-server work proprly .
redis-cli ping
wp redis enable --path=/var/www/html --allow-root
wp redis status --path=/var/www/html --allow-root
# wp theme install astra --activate --allow-root

# Configure PHP-FPM to listen on port 9000
# sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/" /etc/redis/redis.conf
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php

# Start PHP-FPM in the foreground
php-fpm7.3 -F

#!bin/bash


#Running wordpess as root
wp core download  --allow-root

# wp-config-sample.php it's just a template provided by wordpess .
mv   /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php

# cd /var/www/wordpress/
sed -i "s/database_name_here/$DB_NAME/" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASS/" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST/"   /var/www/wordpress/wp-config.php

cd /var/www/wordpress/

#set up wordpress web sit admin
wp core install \
    --url=$URL_WP \
    --title=$TT_WP \
    --admin_user=$AD_USER \
    --admin_password=$AD_PASSWORD\
    --admin_email=$AD_EMAIL \
    --allow-root

#creat a new wordpress user

wp user create \
    $WP_USER \
    $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PASSWORD \
    --allow-root

# install theme to use in wordpress (genaratepress or astra .....)
wp theme install \
    generatepress \
    --allow-root

cd /

#there to ways to make fpm listen to upcoming request

echo "listen = 9000" >> /etc/php/7.3/fpm/php-fpm.conf
mkdir  /run/php

php-fpm7.3 -F

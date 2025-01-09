#!/bin/bash

service mysql start
sleep 1


chown -R mysql:mysql /run/mysqld

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
sleep 1
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;"
sleep 1
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
sleep 1
mariadb -e "FLUSH PRIVILEGES;"
sleep 1

# mariadb : command-line client for MariaDB. It provides a way to execute SQL queries, manage databases, users, and perform various administrative tasks.
# -e : stands for "execute." It allows you to specify a single SQL statement to be executed by MariaDB immediately after connecting.

service  mysql stop
sleep 1

mysqld_safe

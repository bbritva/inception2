#!/bin/bash

service mysql start

mariadb -e "use mysql; update user set password=PASSWORD('${MYSQL_ROOT_PASSWORD}') where User='root'; flush privileges;" &&\
mariadb -e "CREATE DATABASE IF NOT EXISTS  ${MYSQL_DB_NAME};" &&\
mariadb -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
mariadb -e "GRANT ALL PRIVILEGES ON wp.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&\
mariadb -e "FLUSH PRIVILEGES;"

service mysql stop
exec mysqld
# exec /bin/bash
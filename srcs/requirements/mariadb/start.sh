#!/bin/bash
if [ ! -d /var/lib/mysql/${MYSQL_DB_NAME} ];
then
    mysql_install_db --user=root --ldata=/var/lib/mysql
    service mysql start
    sleep 10

    mariadb -u root -e "USE MYSQL; \
    CREATE DATABASE IF NOT EXISTS  ${MYSQL_DB_NAME}; \
    CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
    CREATE USER '${MYSQL_ADMIN}'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';\
    SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}'); \
    FLUSH PRIVILEGES;"

    service mysql stop
fi

exec mysqld

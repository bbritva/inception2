#!/bin/bash

sed -ie 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

echo "CREATE DATABASE ${MYSQL_DB_NAME};" | mysql -u root --skip-password

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};" | mysql -u root --skip-password
echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root --skip-password
echo "GRANT ALL ON ${MYSQL_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"  | mysql -u root --skip-password
echo "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User = 'root' AND Host = 'localhost';" | mysql -u root --skip-password
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
service mysql stop
exec mysqld
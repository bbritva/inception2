#!/bin/bash

sed -ie 's/bind-address/#bind-address/' etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start
mariadb -e "use mysql; update user set password=PASSWORD("${ROOT_PWD}") where User='root'; flush privileges; update user set plugin='' where User='root';" &&\
mariadb -e "CREATE DATABASE IF NOT EXISTS wp DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" &&\
mariadb -e "CREATE USER '${MARIA_LGN}'@'localhost' IDENTIFIED BY '${MARIA_PWD}';" &&\
mariadb -e "GRANT ALL PRIVILEGES ON wp.* TO '${MARIA_LGN}'@'%' IDENTIFIED BY '${MARIA_PWD}';" &&\
mariadb -e "FLUSH PRIVILEGES;"

CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER_ADMIN'@'%' IDENTIFIED BY '$DB_PASSWORD_ADMIN';
GRANT ALL ON $DB_NAME.* TO '$DB_USER_ADMIN'@'%' IDENTIFIED BY '$DB_PASSWORD_ADMIN';
UPDATE mysql.user SET plugin='mysql_native_password' WHERE User = 'root' AND Host = 'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
service mysql stop

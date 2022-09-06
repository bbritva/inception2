#!/bin/sh

if [ ! -e /var/www/html/wp-config.php ];
then
	sed -i -e 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
	cd /var/www/html/
	echo "wp core download --allow-root"
	wp core download --allow-root
	# sleep 10
	echo "wp config create ${MYSQL_DB_NAME}"
	wp config create \
		--dbname=${MYSQL_DB_NAME} \
		--dbuser=${MYSQL_USER} \
		--dbpass=${MYSQL_USER_PASSWORD} \
		--dbcharset="utf8" \
		--dbhost=mariadb:3306 \
		--locale=en_FR \
		--allow-root
	
	echo "wp core install"	
	wp core install \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_LOGIN} \
		--admin_password=${WP_ADMIN_PASSWD} \
		--admin_email=${WP_ADMIN_EMAIL} \
		--allow-root

	echo "wp user create $WP_USER_LOGIN $WP_USER_EMAIL"
	wp user create $WP_USER_LOGIN $WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASSWD \
		--allow-root

	echo "chown"
	chown -R www-data:www-data /var/www/html/

fi

php-fpm7.3 --nodaemonize
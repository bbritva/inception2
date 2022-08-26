#!/bin/sh

if [ ! -e /var/www/html/wordpress/wp-config.php ];
then
	wp config create \
		--dbname=$MYSQL_DB_NAME \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb \
		--locale=en_FR \
		--allow-root
	wp db create --allow-root
	wp core install \
		--url=$DOMAIN_NAME \
		--title=Your_Blog_Title \
		--admin_user=$WP_ADMIN_LOGIN \
		--admin_password=$WP_ADMIN_PASSWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root
	wp user create $WP_USER_LOGIN $WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASSWD \
		--allow-root
fi

php-fpm7.3 --nodaemonize
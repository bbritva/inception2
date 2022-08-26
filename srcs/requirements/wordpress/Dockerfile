FROM debian:buster
RUN apt-get update && apt-get -y install php7.3 php-mysqli php-fpm mariadb-client curl

COPY ./www.conf /etc/php/7.3/fpm/pool.d
COPY /tools/start.sh .
RUN chmod +x /start.sh


ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN rm -f /var/www/wordpress/wp-config-sample.php
RUN mkdir /run/php/

WORKDIR /var/www/wordpress
ENTRYPOINT [ "/start.sh" ]

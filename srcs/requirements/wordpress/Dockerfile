FROM debian:buster
RUN apt-get update && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli \
    php7.3-common php7.3-json php7.3-opcache php7.3-readline php-curl php-gd php-intl \
    php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-client curl

COPY ./www.conf /etc/php/7.3/fpm/pool.d
COPY /start.sh .
RUN chmod +x /start.sh


# ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
# RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
# RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN rm -f /var/www/wordpress/wp-config-sample.php
RUN mkdir /run/php/

EXPOSE 9000

WORKDIR /var/www/wordpress
ENTRYPOINT [ "/start.sh" ]

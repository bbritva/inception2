FROM debian:buster
RUN apt-get update && apt-get -y install mariadb-server
RUN mkdir /root/scripts
WORKDIR /root/scripts
COPY install.sh ./
RUN chmod +x install.sh

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
RUN sed -i 's!#port!port !g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's!127.0.0.1!0.0.0.0!g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql
EXPOSE 3306
CMD [ "sh", "/root/scripts/install.sh" ]
# ENTRYPOINT [ "/bin/bash" ]

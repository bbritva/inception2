FROM debian:buster
RUN apt-get update && apt-get -y install dumb-init mariadb-server
# RUN apt-get -y install dumb-init

COPY start.sh ./
RUN chmod +x start.sh

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql:root /var/lib/mysql /run/mysqld
EXPOSE 3306

# ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "./start.sh" ]
# ENTRYPOINT [ "/bin/bash" ]

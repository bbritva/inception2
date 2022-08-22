FROM debian:buster
RUN echo $MARIA_VERSION
RUN apt-get update && apt-get -y install mariadb-server
RUN mkdir /root/scripts
WORKDIR /root/scripts
COPY install.sh ./
RUN chmod +x install.sh
RUN chown -R mysql:mysql /var/lib/mysql
EXPOSE 3306
ENTRYPOINT [ "sh", "/root/scripts/install.sh" ]
# ENTRYPOINT [ "tail", "-f" ]

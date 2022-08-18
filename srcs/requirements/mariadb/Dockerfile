FROM debian:buster
RUN echo $MARIA_VERSION
RUN apt-get update && apt-get -y install mariadb-server
# RUN mkdir /root/scripts
# WORKDIR /root/scripts
# COPY *.sh ./
# RUN touch file
# RUN ls
# RUN chmod +x install.sh
# RUN chmod +x run.sh
# RUN sh /root/scripts/install.sh
# EXPOSE 3306
ENTRYPOINT [ "tail", "-f" ]

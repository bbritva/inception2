FROM debian:buster
RUN apt-get update && apt-get -y install wget

COPY nginx.conf /etc/nginx/sites-available/default
EXPOSE 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

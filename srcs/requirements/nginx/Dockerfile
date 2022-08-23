FROM debian:buster
RUN apt-get update && apt-get -y install nginx openssl
RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=dev/CN=grvelva/emailAddress=grvelva@student.42.fr"\
    -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
COPY nginx.conf /etc/nginx/sites-available/default
EXPOSE 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

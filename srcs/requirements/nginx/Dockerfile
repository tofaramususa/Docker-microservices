FROM debian:11
RUN apt-get update && apt-get install -y \
	nginx \
	openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
-out /etc/ssl/nginx-selfsigned.crt -subj "/CN=tmususa.42.fr/O=tmususa.42.fr"
COPY /conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


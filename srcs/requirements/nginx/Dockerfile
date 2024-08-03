FROM alpine:3.19

RUN apk upgrade --update-cache

RUN apk add --no-cache nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=tmususa.42.fr/O=tmususa.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf  
# /etc/nginx/sites-enabled/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
#specify where to find the configuration file
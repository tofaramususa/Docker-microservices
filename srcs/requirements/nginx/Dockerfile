FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY ./conf/nginx.conf  /etc/nginx/http.d/nginx.conf

RUN apk update && apk add --no-cache wget curl openssl

WORKDIR /etc/nginx/ssl

RUN curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest \
    | grep browser_download_url \
    | grep linux-amd64 \
    | cut -d '"' -f 4 \
    | wget -qi - \
    && mv mkcert-v*-linux-amd64 mkcert \
    && chmod a+x mkcert

RUN ./mkcert tmususa.42.fr \
    && mv tmususa.42.fr-key.pem tmususa.42.fr.key \
    && mv tmususa.42.fr.pem tmususa.42.fr.crt \
    && rm mkcert

WORKDIR /

RUN chmod 644 /etc/nginx/http.d/nginx.conf

RUN chown -R nginx:nginx /etc/nginx/http.d

RUN chmod 600 /etc/nginx/ssl/tmususa.42.fr.crt
RUN chmod 600 /etc/nginx/ssl/tmususa.42.fr.key

RUN chown -R nginx:nginx /etc/nginx/http.d /etc/nginx/ssl

EXPOSE 443

CMD ["nginx","-g", "daemon off;"]
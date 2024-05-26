FROM debian:11

USER root

RUN apt-get update && apt-get install -y \
	wget \
	curl \
	sendmail \
	php-mysql \
	php-mysqli \
	mariadb-client \
	php \
	php-fpm && \
	mkdir -p /run/php

RUN mkdir -p /var/www/html/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./conf/config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/config.sh"]

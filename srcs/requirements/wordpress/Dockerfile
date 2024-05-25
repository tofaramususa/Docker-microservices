FROM debian:11

USER root

RUN apt update && apt install -y \
	wget \
	curl \
	sendmail \
	php-mysql \
	php-mysqli \
	mariadb-client \
	php \
	php-fpm && \
	mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./requirements/wordpress/conf/config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/config.sh"]

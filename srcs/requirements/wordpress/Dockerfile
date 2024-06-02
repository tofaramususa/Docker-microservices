FROM	alpine:3.17.5
# https://hub.docker.com/_/alpine latest version 3.18.x

ARG		PHP_VERSION=81
		# DB_NAME \
		# DB_USER \
		# DB_PASS \
		# DOMAIN_NAME \
		# WPADUSER \
		# WPADPASS \
		# WPUSER1 \
		# WPUSER1PASS

RUN		apk upgrade --update-cache

RUN		apk add --no-cache \
		php${PHP_VERSION} \
		php${PHP_VERSION}-fpm \
		php${PHP_VERSION}-mysqli \
		php${PHP_VERSION}-json \
		php${PHP_VERSION}-curl \
		php${PHP_VERSION}-dom \
		php${PHP_VERSION}-exif \
		php${PHP_VERSION}-fileinfo \
		php${PHP_VERSION}-mbstring \
		php${PHP_VERSION}-openssl \
		php${PHP_VERSION}-xml \
		php${PHP_VERSION}-zip \
		php${PHP_VERSION}-redis \
		wget \
		curl \
		php-phar \
		unzip

RUN		sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
		sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
		sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php${PHP_VERSION}/php-fpm.d/www.conf

RUN 	mkdir -p /var/www/html/wordpress

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar && php wp-cli.phar --info \
		&& cp wp-cli.phar /usr/local/bin/wp

WORKDIR	/var/www/html/wordpress

COPY	./conf/wp-config-create.sh .

RUN 	sh wp-config-create.sh && rm wp-config-create.sh

RUN		wp core download --force --allow-root

COPY	./conf/wp-init.sh /usr/local/bin/

RUN		chmod +x /usr/local/bin/wp-init.sh

CMD ["/usr/local/bin/wp-init.sh"]
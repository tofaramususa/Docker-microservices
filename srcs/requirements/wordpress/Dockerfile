FROM alpine:3.19

ARG PHP_VERSION=82 \
    DB_NAME \
    DB_USER \
    DB_PASS

RUN 	apk update && apk upgrade && apk add --no-cache \
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
		wget \
		curl \
		php-phar \
		unzip && \
		# Configure the PHP-FPM daemon to listen on port 9000
		sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
			/etc/php82/php-fpm.d/www.conf && \
		sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
			/etc/php82/php-fpm.d/www.conf && \
		sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
			/etc/php82/php-fpm.d/www.conf && \
		# Clean up the package cache to reduce the image size
		rm -f /var/cache/apk/*
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  		&& chmod +x wp-cli.phar && php wp-cli.phar --info \
  		&& cp wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/

COPY 	./conf/setup.sh /usr/local/bin/

RUN		chmod 777 /usr/local/bin/setup.sh

CMD ["/usr/local/bin/setup.sh"]

FROM debian:11

USER root

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client
COPY ./requirements/mariadb/conf/config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config.sh

EXPOSE 3306

CMD ["/usr/local/bin/config.sh"]

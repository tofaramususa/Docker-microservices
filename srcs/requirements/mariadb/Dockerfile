FROM debian:bullseye

RUN apt update && apt install -y mariadb-server systemd

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql/ /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 3306

CMD ["/usr/local/bin/script.sh"]
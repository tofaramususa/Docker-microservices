FROM debian:bullseye

ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
	chmod 777 /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql && \
    chmod 777 /var/run/mysqld && \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee /etc/mysql/mariadb.conf.d/docker.cnf && \
    sed -i "s|skip-networking|skip-networking=0\nmax_allowed_packet=256M|g" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY conf/create_db.sh .
RUN bash create_db.sh && rm create_db.sh
USER mysql
CMD ["mysqld", "--skip-log-error"]
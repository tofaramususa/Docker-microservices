FROM debian:bullseye

RUN apt-get update && apt-get upgrade

RUN apt-get install -y mariadb-server mariadb-client sysvinit-utils

RUN mkdir /var/run/mysqld/ && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./tools/script.sh .

COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod u+x script.sh

EXPOSE 3306

ENTRYPOINT ["./script.sh"]
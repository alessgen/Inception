FROM debian:buster

RUN	apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq mariadb-server gettext-base

WORKDIR /tmp/mariadb/

<<<<<<< HEAD
=======
EXPOSE 3306

>>>>>>> 0ab1d27 (ok)
COPY conf/my.cnf /etc/mysql

COPY conf/script.sh /tmp/mariadb/

ENTRYPOINT ["sh", "/tmp/mariadb/script.sh"]

<<<<<<< HEAD
CMD ["mysqld_safe"]
=======
CMD ["mysqld_safe"]
>>>>>>> 0ab1d27 (ok)

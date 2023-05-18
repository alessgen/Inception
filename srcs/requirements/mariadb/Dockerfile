FROM debian:buster

RUN	apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq mariadb-server gettext-base

WORKDIR /tmp/mariadb/

COPY conf/my.cnf /etc/mysql

COPY conf/script.sh /tmp/mariadb/

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb/script.sh"]

CMD ["mysqld_safe"]

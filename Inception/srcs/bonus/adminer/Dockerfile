FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y wget

WORKDIR /var/www/html/wordpress/

EXPOSE 9000

CMD wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mv adminer-4.8.1.php adminer.php
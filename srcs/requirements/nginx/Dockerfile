FROM debian:buster

RUN apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq nginx openssl

COPY conf/agenoves.42Roma.conf /etc/nginx/sites-enabled/

RUN	openssl req -x509 -nodes -days 365 -subj "/C=IT/ST=RM/O=Alemafe/OU=Gambling/CN=localhost/mail=perchelabiciemiaporcodedio@gmail.com" -newkey rsa:2048 -keyout /etc/ssl/agenoves.key -out /etc/ssl/agenoves.crt

CMD ["nginx", "-g", "daemon off;"]
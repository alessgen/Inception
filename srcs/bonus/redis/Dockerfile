FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install redis redis-server -y 

COPY conf/script.sh /tmp/script.sh

CMD ["sh", "/tmp/script.sh"]
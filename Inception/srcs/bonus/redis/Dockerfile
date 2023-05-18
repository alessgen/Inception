FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install redis redis-server -y 
	
	# php7.3 php7.3-fpm php7.3-mysql curl

# RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
# 		chmod +x wp-cli.phar ;\
# 		mv wp-cli.phar /usr/local/bin/wp

COPY conf/script.sh /tmp/script.sh

CMD ["sh", "/tmp/script.sh"]
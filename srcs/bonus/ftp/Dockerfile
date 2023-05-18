FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y vsftpd ftp

COPY conf/script.sh /tmp/ftp/
COPY conf/vsftpd.conf /etc/

CMD ["bash", "/tmp/ftp/script.sh"]
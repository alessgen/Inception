FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget

WORKDIR /usr/bin/

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

RUN chmod +x /usr/bin/cadvisor-v0.47.0-linux-amd64

CMD ["/usr/bin/cadvisor-v0.47.0-linux-amd64", "-logtostderr", "--port=7000"]


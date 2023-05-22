FROM 		debian:buster

WORKDIR /var/hugo/agenoves_static

RUN 	apt update -y && \
        apt upgrade -y && \
        apt install hugo git -y

RUN     hugo new site /var/hugo/agenoves_static && \
        cd /var/hugo/agenoves_static && \
        git clone https://github.com/vaga/hugo-theme-m10c themes/m10c && \
        hugo new posts/agenoves.html && \
        hugo -b https://agenoves.42.fr/static

COPY    conf/config.toml      /var/hugo/agenoves_static/config.toml
COPY    conf/agenoves.html     /var/hugo/agenoves_static/content/posts/agenoves.html
COPY    conf/avatar.jpg       /var/hugo/agenoves_static/themes/m10c/static/avatar.jpg
COPY    conf/agenoves.html         /var/hugo/agenoves_static/content/about/index.html

EXPOSE 1313

CMD     ["hugo", "server", "--bind=0.0.0.0", "--baseURL=https://agenoves.42.fr/static", \
        "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]

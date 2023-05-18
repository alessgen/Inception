FROM 		debian:buster

WORKDIR /var/hugo/alemafe_static

RUN 	apt update -y && \
        apt upgrade -y && \
        apt install hugo git -y

RUN     hugo new site /var/hugo/alemafe_static && \
        cd /var/hugo/alemafe_static && \
        git clone https://github.com/vaga/hugo-theme-m10c themes/m10c && \
        hugo new posts/alemafe.html && \
        hugo -b https://alemafe.42.fr/static

COPY    conf/config.toml      /var/hugo/alemafe_static/config.toml
COPY    conf/alemafe.html     /var/hugo/alemafe_static/content/posts/alemafe.html
COPY    conf/avatar.jpg       /var/hugo/alemafe_static/themes/m10c/static/avatar.jpg
COPY    conf/alemafe.html         /var/hugo/alemafe_static/content/about/index.html

EXPOSE 1313

CMD     ["hugo", "server", "--bind=0.0.0.0", "--baseURL=https://alemafe.42.fr/static", \
        "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]

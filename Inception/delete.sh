#!/bin/sh

docker image prune --force
docker image rm srcs-nginx
docker image rm srcs-wordpress
docker image rm srcs-mariadb
docker container prune --force
docker volume prune --force
docker volume rm srcs_alemafe_db
docker volume rm srcs_alemafe_nginx
docker container prune --force
rm -rf /home/$USER/data/
docker volume list | grep srcs
if [ $? ]; then
    echo "Checking docker volumes:\e[1;32m OK \e[0m"
fi

docker container list | grep srcs
if [ $? ]; then
    echo "Checking docker containers:\e[1;32m OK \e[0m"
fi

docker image list | grep srcs
if [ $? ]; then
    echo "Checking docker images:\e[1;32m OK \e[0m"
fi

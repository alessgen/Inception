#!/bin/sh

docker image prune --force
<<<<<<< HEAD
docker image rm srcs_nginx
docker image rm srcs_wordpress
docker image rm srcs_mariadb
docker container prune --force
docker volume prune --force
docker volume rm srcs_alemafe_db
docker volume rm srcs_alemafe_nginx
docker volume rm srcs_db
docker volume rm srcs_php_nginx
=======
docker image rm srcs-nginx
docker image rm srcs-wordpress
docker image rm srcs-mariadb
docker container prune --force
docker volume prune --force
docker volume rm srcs-alemafe_db
docker volume rm srcs-alemafe_nginx
docker volume rm srcs-db
docker volume rm srcs-php_nginx
>>>>>>> 0ab1d27 (ok)
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
<<<<<<< HEAD
fi
=======
fi
>>>>>>> 0ab1d27 (ok)

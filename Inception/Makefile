HOME_DIR != getent passwd $(SUDO_USER) | cut -d: -f6;

VOLUMES = srcs_db srcs_php_nginx

<<<<<<< HEAD
IMAGES = srcs_nginx srcs_wordpress srcs_mariadb
=======
IMAGES = srcs-nginx srcs-wordpress srcs-mariadb
>>>>>>> 0ab1d27 (ok)

all:
	mkdir -p ${HOME_DIR}/data/php_nginx
	mkdir -p ${HOME_DIR}/data/db
<<<<<<< HEAD
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml down
=======
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

clean:
	docker compose -f srcs/docker-compose.yml down
>>>>>>> 0ab1d27 (ok)

fclean: clean
	rm -rf /home/$(USER)/data/

re: fclean all

clear-all: fclean purge

purge:
	docker image rm $(IMAGES)
	docker volume rm $(VOLUMES)

<<<<<<< HEAD
.PHONY: all clean fclean re
=======
.PHONY: all clean fclean re
>>>>>>> 0ab1d27 (ok)

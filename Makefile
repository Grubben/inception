dcdirec	= ./srcs/docker-compose.yml

dockCompose = docker-compose -f $(dcdirec)

all	: down
	$(dockCompose) build
	$(dockCompose) up -d

up:	down
	$(dockCompose) build
	$(dockCompose) up

down:
		$(dockCompose) down --remove-orphans 

d	: down


mariadb: down
		docker build ./srcs/requirements/mariadb --tag mariadb
		docker run mariadb
ls:
		$(dockCompose) ps -a

list:	ls

f:
		docker rm -f `docker ps -aq`
		docker image rm `docker images -aq`

dcdirec	= ./srcs/docker-compose.yml

dockCompose = docker-compose -f $(dcdirec)

all	: down
	$(dockCompose) build
	$(dockCompose) up --remove-orphans -d

up:	down
	$(dockCompose) build
	$(dockCompose) up

down:
		$(dockCompose) down 

d	: down

ls:
		$(dockCompose) ps -a

list:	ls

f:
		docker rm -f `docker ps -aq`
		docker image rm `docker images -aq`

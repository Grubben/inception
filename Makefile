dcdirec	= ./srcs/docker-compose.yml

dockCompose = docker-compose -f $(dcdirec)

all	: down
	$(dockCompose) build
	$(dockCompose) up -d

up:	down
	$(dockCompose) build
	$(dockCompose) up

down:
		$(dockCompose) down 

ls:
		$(dockCompose) ps -a

list:	ls
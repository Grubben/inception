dcdirec	= ./srcs/docker-compose.yml

dockCompose = docker-compose -f $(dcdirec)

all	: down
	$(dockCompose) build
	$(dockCompose) up -d

down:
		$(dockCompose) down 

list:
		$(dockCompose) ps -a

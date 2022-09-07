all: build up

up:
	docker-compose -f srcs/docker-compose.yml up -d

build:
	mkdir -p ~/data/db ~/data/wp
	docker-compose -f srcs/docker-compose.yml build

stop: 
	docker-compose -f srcs/docker-compose.yml stop

down: stop

clean: stop
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)

rmdata: 
	sudo rm -rf ~/data

.SILENT:

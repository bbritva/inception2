all: build up

up:
	docker compose -f srcs/docker-compose.yml up -d

build:
	mkdir -p ~/data/db ~/data/wp
	docker compose -f srcs/docker-compose.yml build

stop: 
	docker compose -f srcs/docker-compose.yml stop

clean: stop
	docker-compose -f srcs/docker-compose.yml rm
	# docker system prune -a --force
	docker volume prune
	rm -rf ~/data/db

.SILENT:
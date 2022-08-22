up:
	mkdir -p ~/data/db
	docker compose -f srcs/docker-compose.yml up -d

build:
	docker compose -f srcs/docker-compose.yml build

stop: 
	docker compose -f srcs/docker-compose.yml stop

clean: stop
	docker-compose -f srcs/docker-compose.yml rm
	# docker system prune -a --force
	docker volume prune
	rm -rf ~/data/db

.SILENT:
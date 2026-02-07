.PHONY: all down re

COMPOSE_FILE=./srcs/docker-compose.yml

all:
	mkdir -p ../data/wordpress
	mkdir -p ../data/mariadb
	docker compose -f $(COMPOSE_FILE) build
	docker compose -f $(COMPOSE_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) down 

re: down all

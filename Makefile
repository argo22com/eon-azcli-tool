#!/usr/bin/make -f

.PHONY: run
run:
	COMPOSE_DOCKER_CLI_BUILD=1 docker-compose up --build --force-recreate -d

.PHONY: stop
stop:
	docker-compose down

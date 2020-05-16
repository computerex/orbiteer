.PHONY: build start stop ngrok bash logs followlogs status test

build:
	docker-compose down
	docker-compose rm
	docker-compose build

start:
	docker-compose up

stop:
	docker-compose down

bash-database:
	docker-compose exec orbiteer-database bash

bash-api:
	docker-compose exec orbiteer-api bash

logs:
	docker-compose logs orbiteer-api

followlogs:
	docker-compose logs -f orbiteer-api

status:
	docker-compose ps
